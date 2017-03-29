from distutils.core import setup, Extension

hb_convert = Extension('hb_convert',
                    define_macros = [('MAJOR_VERSION', '0'),
                                     ('MINOR_VERSION', '1')],
                    include_dirs = ['/usr/include', '/usr/include/harfbuzz', '/usr/include/freetype2'],
                    libraries = ['freetype', 'harfbuzz'],
                    library_dirs = ['/usr/lib'],
                    sources = ['hb_convert.c'])

setup (name = 'Harfbuzz Glyph Name Conversion',
       version = '0.1',
       description = '',
       author = '',
       author_email = '',
       url = '',
       long_description = '''
''',
       ext_modules = [hb_convert])

