as yet unclassified
assert: aBoolean operator: anOperator expected: anExpectedValue
	| actual expected |
	actual := subject.
	expected := anExpectedValue.
	
	testCase
		assert: (negated ifTrue: [ aBoolean not ] ifFalse: [ aBoolean ])
		description: ('Expected {1} to{3} {4} {2}' format: {
			actual printString.
			expected printString.
			negated ifTrue: [' not'] ifFalse: [''].
			anOperator})