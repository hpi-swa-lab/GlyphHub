as yet unclassified
testReadyGlyphs

	| loader |
	loader := FRTGlyphLoader new.
	
	(self expect: (loader canDrawImmediately: #('A' 'a') font: font atVersion: font latestVersionHash)) to be: false.
	
	(self expect: (loader
		loadGlyphs: #('A' 'a')
		from: font
		atVersion: font latestVersionHash)) to resolve.
	
	(self expect: (loader canDrawImmediately: #('A' 'a') font: font atVersion: font latestVersionHash)) to be: true