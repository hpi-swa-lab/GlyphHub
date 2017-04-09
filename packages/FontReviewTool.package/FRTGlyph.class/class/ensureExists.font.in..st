accessing
ensureExists: aGlyphNameStringCollection font: aFont in: aBackend

	| allGlyphs |
	^ ((self loadBy: 'glyphName' value: aGlyphNameStringCollection from: aBackend)
		then: [:glyphs |
			allGlyphs := glyphs asOrderedCollection.
			((aGlyphNameStringCollection
				reject: [:glyphName | glyphs includes: glyphName])
				collect: [:glyphName | self new glyphName: glyphName; font: aFont] as: BTModelList)
				saveTo: aBackend])
		then: [:newGlyphs | allGlyphs addAll: newGlyphs]