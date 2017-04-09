geometry
extentOf: aGlyphNameStringCollection size: aPointSizeNumber
	
	| scaleFactor width |
	scaleFactor := self scaleFactorAt: aPointSizeNumber.
	width := 0.
	
	aGlyphNameStringCollection do: [:glyphName | | glif |
		glif := glifs at: glyphName ifAbsent: [
			^ self error: 'Can''t measure requested glif, data not loaded yet. See #loadDataFor:'].
		glif ifNotNil: [
			width := width + (((glif firstTagNamed: #advance) ifNotNilDo: [:attr | attr attributeAt: #width ifAbsent: [0]] ifNil: [0]) * scaleFactor)]].
	
	^ width @ ((fontinfo at: 'ascender') - (fontinfo at: 'descender') * scaleFactor)