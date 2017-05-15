as yet unclassified
allKnownRequiredGlyphNamesFor: aCachedGlyph
	
	aCachedGlyph loaded ifFalse: [^ {aCachedGlyph}].
	
	^ OrderedCollection streamContents: [:stream |
		aCachedGlyph glif tagsNamed: #component do: [:component | | componentGlyph |
			componentGlyph := self lookupCached: (aCachedGlyph withGlyphName: (component attributeAt: #base)).
			stream nextPutAll: (self allKnownRequiredGlyphNamesFor: componentGlyph)]]