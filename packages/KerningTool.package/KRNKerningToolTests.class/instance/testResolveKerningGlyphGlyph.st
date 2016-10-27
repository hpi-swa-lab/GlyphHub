as yet unclassified
testResolveKerningGlyphGlyph
	self
		assert: -50 equals: (font findKerningBetweenName: 'A' and: 'V');
		assert: 0 equals: (font findKerningBetweenName: 'V' and: 'V');
		assert: 0 equals: (font findKerningBetweenName: 'V' and: 'A')