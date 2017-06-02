testing
testReadyComponentGlyph

	| loader |
	loader := FRTGlyphLoader new.
	
	(self expect: (loader canDrawImmediately: #('componentBasedGlif') font: font atVersion: font latestVersionHash)) to be: false.
	
	(self expect: (loader
		loadGlyphs: #('componentBasedGlif')
		from: font
		atVersion: font latestVersionHash)) to resolve.
	
	(self expect: (loader canDrawImmediately: #('componentBasedGlif') font: font atVersion: font latestVersionHash)) to be: true.
	
	(self expect: (loader loaderFor: font atVersion: font latestVersionHash) glifs size) to equal: 2