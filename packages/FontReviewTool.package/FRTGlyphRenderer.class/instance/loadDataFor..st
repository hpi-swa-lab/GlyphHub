drawing
loadDataFor: aGlyphNameStringCollection
	" prepare this renderer for drawing all given glyph names. returns a promise. "

	| query missingGlyphs |
	((self canDrawImmediately: aGlyphNameStringCollection) or: [aGlyphNameStringCollection isEmpty])
		ifTrue: [^ BTPromise unit: self].
	
	query := Dictionary new.
	fontinfo ifNil: [query at: 'fontinfo' put: nil].
	missingGlyphs := aGlyphNameStringCollection reject: [:glyphName | glifs includesKey: glyphName].
	query at: 'glifs' put: missingGlyphs.
	
	self flag: #todo. " also need to load all necessary components "
	
	^ self loadQuery: query