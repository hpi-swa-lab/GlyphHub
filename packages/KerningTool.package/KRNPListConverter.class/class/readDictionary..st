reading
readDictionary: anXMLNode
	| elements index dictionary |
	
	dictionary := OrderedDictionary new.
	elements := anXMLNode elements.
	
	index := 1.
	[index < (anXMLNode elements size)] whileTrue: [
		dictionary
			at: (( anXMLNode elements at: index ) contentString asSymbol )
			put: ( self readElement: ( anXMLNode elements at: index+1 )).
		index := index + 2 ].
	^ dictionary