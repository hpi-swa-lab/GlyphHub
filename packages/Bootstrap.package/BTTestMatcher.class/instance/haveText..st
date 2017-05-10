ui-matching
haveText: aString

	self subject allMorphsDo: [:morph |
		((morph isKindOf: BTLabel) and: [morph text = aString]) ifTrue: [^ self]].
	
	self assert: false operator: 'have text' expected: aString