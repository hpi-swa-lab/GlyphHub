matching
raise: anErrorClass
	[subject value] on: anErrorClass do: [ self assert: false operator: 'raise' expected: anErrorClass ]