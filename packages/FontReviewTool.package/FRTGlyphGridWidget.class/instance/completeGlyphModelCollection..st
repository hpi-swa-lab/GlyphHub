accessing
completeGlyphModelCollection: aCollectionOfFRTGlyphs

	^ self glyphNames collect: [:glyphName |
		aCollectionOfFRTGlyphs
			detect: [:glyphModel | glyphModel glyphName = glyphName]
			ifNone: [FRTGlyph new
				glyphName: glyphName;
				threadGlyphAssociations: BTModelList new]]