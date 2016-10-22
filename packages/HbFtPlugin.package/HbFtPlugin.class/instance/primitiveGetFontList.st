as yet unclassified
primitiveGetFontList
	<var: #filePtr type: 'char *'>
	<var: #familyPtr type: 'char *'>
	<var: #stylePtr type: 'char *'>
	<export: true>

	| arrayOop i structOop familyPtr filePtr stylePtr |

	self cCode: '	FcPattern* pat = FcPatternCreate();
	FcObjectSet* os = FcObjectSetBuild(FC_FAMILY, FC_STYLE, FC_FILE, (char *) 0);
	FcFontSet* fs = FcFontList(sqFontLibraryGet()->fc_config, pat, os);'.

	i := 0.
	filePtr := nil.
	familyPtr := nil.
	stylePtr := nil.

	arrayOop := interpreterProxy instantiateClass: interpreterProxy classArray indexableSize: (self cCode: 'fs->nfont').

	self cCode: 'for (; fs && i < fs->nfont; i++) {
		FcPattern* font = fs->fonts[i];
		FcChar8 *file, *family, *style;
		if (FcPatternGetString(font, FC_FILE, 0, &file) == FcResultMatch &&
				FcPatternGetString(font, FC_FAMILY, 0, &family) == FcResultMatch &&
				FcPatternGetString(font, FC_STYLE, 0, &style) == FcResultMatch) {
			filePtr = (char *) file; familyPtr = (char *) family; stylePtr = (char *) style;'.

	structOop := interpreterProxy instantiateClass: interpreterProxy classArray indexableSize: 3.
	interpreterProxy storePointer: 0 ofObject: structOop withValue: (self getString: filePtr).
	interpreterProxy storePointer: 1 ofObject: structOop withValue: (self getString: familyPtr).
	interpreterProxy storePointer: 2 ofObject: structOop withValue: (self getString: stylePtr).

	interpreterProxy storePointer: i ofObject: arrayOop withValue: structOop.

	self cCode: '}
	}

	if (fs)
		FcFontSetDestroy(fs);'.

	interpreterProxy push: arrayOop