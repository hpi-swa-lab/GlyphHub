as yet unclassified
cacheFontinfo: aFontinfoDictionary for: aCachedGlyph

	fontinfoCache
		at: (FRTCachedFontinfoKey new
			font: aCachedGlyph font;
			versionHash: aCachedGlyph versionHash)
		put: aFontinfoDictionary