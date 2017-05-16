as yet unclassified
testLoadMultipleGlyphs

	| glyphPromise |
	glyphPromise := FRTGlyphLoader new
		loadGlyphs: #('simpleGlif' 'A' 'a')
		from: font
		atVersion: font latestVersionHash.
		
	(self expect: glyphPromise) to resolve.
	(self expect: glyphPromise value size) to equal: 3