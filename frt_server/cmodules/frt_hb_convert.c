#include <Python.h>

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <hb.h>
#include <hb-ft.h>

#define FONT_SIZE 36
#define MARGIN (FONT_SIZE * .5)

const char* ftGetErrorMessage(FT_Error err)
{
#undef __FTERRORS_H__
#define FT_ERRORDEF( e, v, s  )  case e: return s;
#define FT_ERROR_START_LIST     switch (err) {
#define FT_ERROR_END_LIST       }
#include FT_ERRORS_H
return "(Unknown error)";
}


static PyObject *
frt_hb_convert_to_glyphnames(PyObject *self, PyObject *args)
{
	const char *fontfile;
	const char *text;
	PyObject *feature_strings;
	if (!PyArg_ParseTuple(args, "ssO", &fontfile, &text, &feature_strings))
		return NULL;

	/* Initialize FreeType and create FreeType font face. */
	FT_Library ft_library;
	FT_Face ft_face;
	FT_Error ft_error;

	if ((ft_error = FT_Init_FreeType (&ft_library))) {
		printf("Error initializing ft: %s\n", ftGetErrorMessage(ft_error));
		return Py_None;
	}
	if ((ft_error = FT_New_Face (ft_library, fontfile, 0, &ft_face))) {
		printf("Error loading font face: %s\n", ftGetErrorMessage(ft_error));
		return Py_None;
	}
	if ((ft_error = FT_Set_Char_Size (ft_face, FONT_SIZE*64, FONT_SIZE*64, 0, 0))) {
		printf("Error settings font size: %s\n", ftGetErrorMessage(ft_error));
		return Py_None;
	}

	/* Create hb-ft font. */
	hb_font_t *hb_font;
	hb_font = hb_ft_font_create (ft_face, NULL);

	/* Create hb-buffer and populate. */
	hb_buffer_t *hb_buffer;
	hb_buffer = hb_buffer_create ();
	hb_buffer_add_utf8 (hb_buffer, text, -1, 0, -1);
	hb_buffer_guess_segment_properties (hb_buffer);

	PyObject *iter = PyObject_GetIter(feature_strings);
	int num_features = PyList_Size(feature_strings);
	hb_feature_t *features = calloc(num_features, sizeof(hb_feature_t));
	int feature_index = 0;
	if (iter) {
	    while (1) {
		PyObject *next = PyIter_Next(iter);
		if (!next)
		    break;
		const char *feature_string = PyUnicode_AsUTF8(next);
		if (hb_feature_from_string(feature_string, -1, features + feature_index))
		    feature_index++;
	    }
	}

	/* Shape it! */
	hb_shape (hb_font, hb_buffer, features, feature_index);
	free(features);

	/* Get glyph information and positions out of the buffer. */
	unsigned int len = hb_buffer_get_length (hb_buffer);
	hb_glyph_info_t *info = hb_buffer_get_glyph_infos (hb_buffer, NULL);

	/* Put glyphs and clusters into list */

	PyObject *glyph_list = PyList_New(len);

	unsigned int i;
	for (i = 0; i < len; i++) {
		PyObject *tuple, *glyphname, *cluster;

		hb_codepoint_t gid   = info[i].codepoint;
		unsigned int cluster_int = info[i].cluster;
		char glyphname_string[32];
		hb_font_get_glyph_name (hb_font, gid, glyphname_string, sizeof (glyphname_string));

		tuple = PyTuple_New(2);
		glyphname = PyUnicode_FromString(glyphname_string);
		cluster = PyLong_FromUnsignedLong(cluster_int);

		PyTuple_SetItem(tuple, 0, glyphname);
		PyTuple_SetItem(tuple, 1, cluster);

		PyList_SetItem(glyph_list, i, tuple);
	}

	hb_buffer_destroy (hb_buffer);
	hb_font_destroy (hb_font);

	FT_Done_Face (ft_face);
	FT_Done_FreeType (ft_library);

	return glyph_list;
}

/* definition of python methods, consisting of {name, functionality, interpreter flags, documentation string} */
static PyMethodDef HbConvertMethods[] = {
    {"to_glyphnames",  frt_hb_convert_to_glyphnames, METH_VARARGS,
     "Execute a shell command."},
    {NULL, NULL, 0, NULL}        /* Sentinel */
};

/* definition of our python module, named "frt_hb_convert" */
static struct PyModuleDef frt_hb_convert_module = {
	PyModuleDef_HEAD_INIT,
	"frt_hb_convert",   /* name of module */
	NULL, /* module documentation, may be NULL */
	-1,       /* size of per-interpreter state of the module,
				 or -1 if the module keeps state in global variables. */
	HbConvertMethods
};
PyMODINIT_FUNC
PyInit_frt_hb_convert(void)
{
    return PyModule_Create(&frt_hb_convert_module);
}

int main(int argc, char *argv[])
{
    wchar_t *program = Py_DecodeLocale(argv[0], NULL);
    if (program == NULL) {
        fprintf(stderr, "Fatal error: cannot decode argv[0]\n");
        exit(1);
    }

    /* Add a built-in module, before Py_Initialize */
    PyImport_AppendInittab("frt_hb_convert", PyInit_frt_hb_convert);

    /* Pass argv[0] to the Python interpreter */
    Py_SetProgramName(program);

    /* Initialize the Python interpreter.  Required. */
    Py_Initialize();

    /* Optionally import the module; alternatively,
       import can be deferred until the embedded script
       imports it. */
    PyImport_ImportModule("frt_hb_convert");

    PyMem_RawFree(program);
    return 0;
}
