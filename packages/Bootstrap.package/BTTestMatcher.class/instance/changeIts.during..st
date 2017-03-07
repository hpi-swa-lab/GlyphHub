as yet unclassified
changeIts: aSelector during: aBlock
	| newValue oldValue |
	oldValue := subject perform: aSelector.
	aBlock value.
	newValue := subject perform: aSelector.
	
	self assert: oldValue ~= newValue operator: ('change its {1} (went from {2} to {3})' format: {
		aSelector asString.
		oldValue.
		newValue
	}) expected: nil