instance creation
ensureExists: aGlyphNameStringCollection font: aFont in: aBackend

	| allGlyphs |
	^ ((self loadWhere: 'glyphName' equals: aGlyphNameStringCollection from: aBackend populate: #())
		then: [:glyphs |
			allGlyphs := glyphs asOrderedCollection.
			((aGlyphNameStringCollection
				reject: [:glyphName | glyphs includes: glyphName])
				collect: [:glyphName | self new glyphName: glyphName; font: aFont] as: BTModelList)
				saveTo: aBackend])
		then: [:newGlyphs | allGlyphs addAll: newGlyphs]