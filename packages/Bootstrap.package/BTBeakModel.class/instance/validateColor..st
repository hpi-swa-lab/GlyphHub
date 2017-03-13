as yet unclassified
validateColor: aString
	self color ifNotNil: [(self expect: aString field: #color) to beOneOf: #('Yellow' 'Orange' 'Black' 'Red')]