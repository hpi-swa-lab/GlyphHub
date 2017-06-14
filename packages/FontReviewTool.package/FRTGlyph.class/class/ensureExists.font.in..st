instance creation
ensureExists: aGlyphNameStringCollection font: aFont in: aBackend

	| allGlyphs |
	^ ((self loadWhere: {#glyphName -> aGlyphNameStringCollection. #font -> aFont} populate: #(font 'font.family') from: aBackend)
		then: [:glyphs | | glyphsExistingInDatabase |
			allGlyphs := glyphs asOrderedCollection.
			glyphsExistingInDatabase := glyphs collect: #glyphName.
			((aGlyphNameStringCollection 
				copyWithoutAll: (glyphsExistingInDatabase
					add: '.notdef';
					yourself))
				collect: [:glyphName | self new glyphName: glyphName; font: aFont] as: BTModelList)
				saveTo: aBackend])
		then: [:newGlyphs |
			(allGlyphs anySatisfy: [:glyph | glyph glyphName = '.notdef']) ifFalse: [allGlyphs add: FRTUndefinedGlyph new].
			allGlyphs
				addAll: newGlyphs;
				yourself]