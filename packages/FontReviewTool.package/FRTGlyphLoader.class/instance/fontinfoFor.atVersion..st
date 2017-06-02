as yet unclassified
fontinfoFor: aFont atVersion: aVersionHashString
	" access the fontinfo for a font. only available after loading at least one glyph for this (font, version) tuple "

	^ (self loaderFor: aFont atVersion: aVersionHashString) fontinfo