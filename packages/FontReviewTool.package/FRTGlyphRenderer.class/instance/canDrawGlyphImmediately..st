helper-drawing
canDrawGlyphImmediately: aString

	| glif |
	glif := glifs at: aString ifAbsent: [^ false].

	glif ifNotNil: [
		glif tagsNamed: #component do: [:component |
			(self canDrawGlyphImmediately: (component attributeAt: #base)) ifFalse: [^ false]]].

	^ true