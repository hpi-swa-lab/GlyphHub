as yet unclassified
testLoadSimpleGlyph

	| glyphPromise |
	glyphPromise := FRTGlyphLoader new
		loadGlyph: 'simpleGlif'
		from: font
		atVersion: font latestVersionHash.
		
	(self expect: glyphPromise) to resolve.
		
	(self expect: glyphPromise value glif asString) to equal: (XMLDOMParser parseDocumentFrom: self simpleGlif readStream) asString