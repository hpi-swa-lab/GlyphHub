ui-matching
haveA: aClass labelled: aString

	self subject allMorphsDo: [:morph |
		((morph isKindOf: aClass) and: [morph text = aString]) ifTrue: [^ morph]].
	
	self assert: false operator: 'have a ', aClass name, ' with the label' expected: aString