as yet unclassified
allKnownRequiredGlyphNamesFor: aGlyphName
	
	^ glifs
		at: aGlyphName
		ifPresent: [:glifPromise |
			glifPromise isPending
				ifTrue: [{aGlyphName}]
				ifFalse: [
					OrderedCollection streamContents: [:stream |
						glifPromise value tagsNamed: #component do: [:component | 
							stream nextPutAll:
								(self allKnownRequiredGlyphNamesFor: (component attributeAt: #base))]]]]
		ifAbsent: [{aGlyphName}]