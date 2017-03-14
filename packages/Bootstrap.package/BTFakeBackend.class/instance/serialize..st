as yet unclassified
serialize: aModel
	| dictionary |
	dictionary := Dictionary new.
	
	aModel class instVarNames do: [ :name | | field |
		field := aModel instVarNamed: name.
		dictionary at: name asString put: (self serializeField: field) ].
	
	dictionary at: 'id' put: aModel id.
	
	^dictionary