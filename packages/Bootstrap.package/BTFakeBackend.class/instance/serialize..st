as yet unclassified
serialize: aModel
	| dictionary |
	dictionary := Dictionary new.
	
	aModel class instVarNames do: [ :name | | field |
		field := aModel instVarNamed: name.
		dictionary at: name asString put: (field isBTModel ifTrue: [field id] ifFalse: [field]) ].
	
	dictionary at: 'id' put: aModel id.
	
	^dictionary