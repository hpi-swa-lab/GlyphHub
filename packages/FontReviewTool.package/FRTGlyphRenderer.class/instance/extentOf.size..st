geometry
extentOf: aGlyphNameStringCollection size: aPointSizeNumber
	
	| rectangle advance |
	rectangle := self boundsOfGlyphs: aGlyphNameStringCollection atPointSize: aPointSizeNumber.
	
	advance := (aGlyphNameStringCollection
		collect: [:name | glifs at: name ifPresent: [:glif | self advanceOf: glif] ifAbsent: [nil]]
		thenSelect: #notNil) ifNotEmptyDo: #sum ifEmpty: [0].
	
	^ rectangle extent max: (advance @ self fontHeight * (self scaleFactorAt: aPointSizeNumber))