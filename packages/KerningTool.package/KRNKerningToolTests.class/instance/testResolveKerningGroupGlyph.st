as yet unclassified
testResolveKerningGroupGlyph
	self
		assert: 7 equals: (font findKerningBetweenName: 'T' and: 'U');
		assert: 7 equals: (font findKerningBetweenName: 'F' and: 'U');
		assert: 3 equals: (font findKerningBetweenName: 'T' and: 'X');
		assert: 3 equals: (font findKerningBetweenName: 'F' and: 'X')