as yet unclassified
parseValueDict: anXMLNode into: dict
	| key value elements index element |
	key := nil.
	value := OrderedCollection new.
	
	elements := anXMLNode elements.
	index := 1.
	[index <= elements size] whileTrue: [
		element := elements at: index.
		
		element tag = #key
			ifTrue: [
				key ifNotNil: [ dict at: key put: (self parseValue: value) ].
				key := element contentString.
				value := OrderedCollection new ]
			ifFalse: [ value add: element ].
		index := index + 1 ].

	key ifNotNil: [ dict at: key put: (self parseValue: value) ].
	
	^dict