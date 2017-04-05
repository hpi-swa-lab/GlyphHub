drawing
extentOf: aGlyphNameStringCollection size: aNumber
	
	| scaleFactor width |
	scaleFactor := self scaleFactorAt: aNumber.
	width := 0.
	
	aGlyphNameStringCollection do: [:glyphName | | glif |
		glif := glifs at: glyphName ifAbsent: [self error: 'Can''t measure requested glif, data not loaded yet. See #loadDataFor:'].
		width := ((glif firstTagNamed: #advance) attributeAt: #width ifAbsent: [0]) * scaleFactor + width].
	
	^ width @ ((fontinfo at: 'ascender') - (fontinfo at: 'descender') * scaleFactor)