as yet unclassified
lookupCached: aCachedGlyph
	" for glyph that can only have its glyphName, versionHash, font tuple filled out, check for a loaded version of it "

	^ glyphCache at: aCachedGlyph hash ifAbsentPut: [aCachedGlyph]