as yet unclassified
testResolveKerningGroupGroup
	self
		assert: 17 equals: (font findKerningBetweenName: 'T' and: 'W');
		assert: 17 equals: (font findKerningBetweenName: 'T' and: 'V');
		assert: 17 equals: (font findKerningBetweenName: 'F' and:  'W');
		assert: 17 equals: (font findKerningBetweenName: 'F' and: 'V')