as yet unclassified
decreaseIts: aSelector during: aBlock
	| newValue oldValue |
	oldValue := subject perform: aSelector.
	aBlock value.
	newValue := subject perform: aSelector.
	
	self assert: newValue < oldValue operator: ('decrease its {1} (went from {2} to {3})' format: {
		aSelector asString.
		oldValue.
		newValue
	}) expected: nil