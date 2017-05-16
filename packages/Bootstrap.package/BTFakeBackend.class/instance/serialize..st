as yet unclassified
serialize: aModel
	| dictionary |
	dictionary := Dictionary new.
	
	aModel class fieldNames do: [:name | | field |
		field := aModel get: name.
		dictionary at: name asString put: (self serializeField: field)].
	
	dictionary at: 'id' put: aModel id.
	
	^dictionary