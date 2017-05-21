A FRTGlyphLoader stores glif outlines for fonts at specific versions. The structure of the cache is as follows:

glyphCache: FRTCachedFontinfoKey(font_id, version_hash) -> glyph_name -> Promise(glif)

fontinfoCache: FRTCachedFontinfoKey(font_id, version_hash) -> fontinfo xml