geometry
extentOf: aGlyphNameStringCollection size: aPointSizeNumber
	
	| rectangle advance |
	rectangle := self boundsOfGlyphs: aGlyphNameStringCollection atPointSize: aPointSizeNumber.
	
	advance := (aGlyphNameStringCollection
		collect: [:name | self glifNamed: name  ifLoaded: [:glif | self advanceOf: glif] ifNotLoaded: [nil]]
		thenSelect: #notNil) ifNotEmptyDo: #sum ifEmpty: [0].
	
	^ rectangle extent max: (advance @ self fontHeight * (self scaleFactorAt: aPointSizeNumber))