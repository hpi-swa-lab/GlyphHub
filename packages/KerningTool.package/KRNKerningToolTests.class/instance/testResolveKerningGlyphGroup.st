as yet unclassified
testResolveKerningGlyphGroup
	self
		assert: 10 equals: (font findKerningBetweenName: 'B' and: 'V');
		assert: 10 equals: (font findKerningBetweenName: 'B' and: 'W')