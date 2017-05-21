as yet unclassified
testFontinfoLoaded

	| loader |
	loader := FRTGlyphLoader new.
	
	(self expect: [loader fontinfoFor: font atVersion: font latestVersionHash]) to raise: Error.
	
	(self expect: (loader
		loadGlyph: 'A'
		from: font
		atVersion: font latestVersionHash)) to resolve.
	
	(self expect: [loader fontinfoFor: font atVersion: font latestVersionHash]) to not raise: Error