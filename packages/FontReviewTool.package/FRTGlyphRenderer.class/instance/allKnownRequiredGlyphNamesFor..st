helper-loading
allKnownRequiredGlyphNamesFor: aGlyphNameCollection
	
	| required |
	required := OrderedCollection new.
	aGlyphNameCollection do: [:glyphName |
		glifs at: glyphName
			ifPresent: [:glif |
				glif ifNotNil: [
					glif tagsNamed: #component do: [:component |
						required addAll: (self allKnownRequiredGlyphNamesFor: {component attributeAt: #base})]]]
			ifAbsent: [required add: glyphName]].

	^ required