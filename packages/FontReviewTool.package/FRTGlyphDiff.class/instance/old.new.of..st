as yet unclassified
old: aGlif new: anotherGlif of: aFont

	old := aGlif.
	new := anotherGlif.
	
	renderer
		font: aFont;
		fontinfo: ({'ascender' -> 8000. 'unitsPerEm' -> 1000. 'descender' -> -200} as: Dictionary)