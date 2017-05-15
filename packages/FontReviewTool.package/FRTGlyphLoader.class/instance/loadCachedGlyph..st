as yet unclassified
loadCachedGlyph: aCachedGlyph

	| missingGlyph query |
	query := Dictionary new.
	query
		at: 'fontinfo'
		put: nil.
	missingGlyph := self allKnownRequiredGlyphNamesFor: aCachedGlyph.
	query
		at: 'glifs'
		put: missingGlyph.
	
	aCachedGlyph loadingPromise: BTPromise new.
	
	^ (self loadQuery: query for: aCachedGlyph) then: [aCachedGlyph]