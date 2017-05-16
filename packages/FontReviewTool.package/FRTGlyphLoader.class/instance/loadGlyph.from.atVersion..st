as yet unclassified
loadGlyph: aGlyphNameString from: aFont atVersion: aVersionHashString

	| cached |
	cached := self lookupCached: (FRTCachedGlyph new
		glyphName: aGlyphNameString;
		font: aFont;
		versionHash: aVersionHashString;
		yourself).
	
	^ (cached loaded or: [cached loading])
		ifTrue: [cached loadingPromise]
		ifFalse: [self loadCachedGlyph: cached]