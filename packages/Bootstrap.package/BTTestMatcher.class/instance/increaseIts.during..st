as yet unclassified
increaseIts: aSelector during: aBlock
	| newValue oldValue |
	oldValue := subject perform: aSelector.
	aBlock value.
	newValue := subject perform: aSelector.
	
	self assert: newValue > oldValue operator: ('increase its {1} (went from {2} to {3})' format: {
		aSelector asString.
		oldValue.
		newValue
	}) expected: nil