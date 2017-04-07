drawing
loadDataForAllGlyphs
	" prepare this renderer for drawing all glyph names. returns a promise. "
	
	| query |
	query := Dictionary new.
	query at: 'glifs' put: nil.
	fontinfo ifNil: [query at: 'fontinfo' put: nil].
	
	^ self loadQuery: query