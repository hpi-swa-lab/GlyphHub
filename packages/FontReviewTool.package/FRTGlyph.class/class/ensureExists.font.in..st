instance creation
ensureExists: aGlyphNameStringCollection font: aFont in: aBackend

	| allGlyphs |
	^ ((self loadWhere: 'glyphName' equals: aGlyphNameStringCollection from: aBackend populate: #(font 'font.family'))
		then: [:glyphs | | existingGlyphs |
			allGlyphs := glyphs asOrderedCollection.
			existingGlyphs := glyphs collect: #glyphName.
			((aGlyphNameStringCollection
				reject: [:glyphName | (existingGlyphs includes: glyphName) or: [glyphName = '.notdef']])
				collect: [:glyphName | self new glyphName: glyphName; font: aFont] as: BTModelList)
				saveTo: aBackend])
		then: [:newGlyphs |
			(allGlyphs anySatisfy: [:glyph | glyph glyphName = '.notdef']) ifFalse: [allGlyphs add: FRTUndefinedGlyph new].
			allGlyphs
				addAll: newGlyphs;
				yourself]