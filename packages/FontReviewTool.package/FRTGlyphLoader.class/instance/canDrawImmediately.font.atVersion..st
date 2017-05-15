as yet unclassified
canDrawImmediately: aGlyphNameCollection font: aFont atVersion: aVersionHashString

	| allGlyphNames cached |
	cached := FRTCachedGlyph new
		font: aFont;
		versionHash: aVersionHashString.
	
	allGlyphNames := aGlyphNameCollection gather: [:glyphName |
		self allKnownRequiredGlyphNamesFor: (cached withGlyphName: glyphName)].
	
	^ allGlyphNames allSatisfy: [:cachedGlyph |
		glyphCache at: cachedGlyph hash ifPresent: [:glyph | glyph loaded] ifAbsent: [false]]