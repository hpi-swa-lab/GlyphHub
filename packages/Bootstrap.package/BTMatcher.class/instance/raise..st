matching
raise: anErrorClass
	| result |
	result := [subject value. false ] on: anErrorClass do: [ :error | error return: true ].
	self assert: result operator: 'raise' expected: anErrorClass