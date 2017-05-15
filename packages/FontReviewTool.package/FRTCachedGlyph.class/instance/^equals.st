as yet unclassified
= aCachedGlyph

	^ self versionHash = aCachedGlyph versionHash and:
	[self font id = aCachedGlyph font id and:
	[self glyphName = aCachedGlyph glyphName]]