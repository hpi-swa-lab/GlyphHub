as yet unclassified
testReadGroup
	self
		assert: ({'A'. 'Aacute'. 'Abreve'} hasEqualElements: (font groups at: 'A_'));
		assert: {'standard'} equals: (font groupsContaining: 'C');
		assert: {'A_'. 'standard'} equals: (font groupsContaining: 'A');
		assert: {'public.kern2.V'} equals: (font groupsContaining: 'W')