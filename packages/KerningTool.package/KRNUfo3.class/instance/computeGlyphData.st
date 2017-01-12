as yet unclassified
computeGlyphData
	self glyphFlyweights: OrderedDictionary new.
	codePointsTable keysAndValuesDo: [ :unicode :glif |
		self glyphFlyweights at: unicode put: (KRNVectorData newForXML: glif from: self)]