drawing
loadDataFor: aGlyphNameStringCollection
	" prepare this renderer for drawing all given glyph names. returns a promise. "

	| query missingGlyphs |
	((self canDrawImmediately: aGlyphNameStringCollection) or: [aGlyphNameStringCollection isEmpty])
		ifTrue: [^ BTPromise unit: self].
	
	query := Dictionary new.
	self fontinfo ifNil: [query at: 'fontinfo' put: nil].
	missingGlyphs := (self allKnownRequiredGlyphNamesFor: aGlyphNameStringCollection) reject: [:glyphName | glifs includesKey: glyphName].
	query at: 'glifs' put: missingGlyphs.
	
	^ (self loadQuery: query)
		then: [
			" recurse. if we have everything, this will just resolve "
			self loadDataFor: aGlyphNameStringCollection]