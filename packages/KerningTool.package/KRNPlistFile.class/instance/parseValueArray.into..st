as yet unclassified
parseValueArray: anXMLNode into: anOrderedCollection
	| elements index |
	
	elements := anXMLNode elements.
	index := 1.
	[index <= elements size] whileTrue: [
		anOrderedCollection add: (self parseValue: (elements at: index))].
	
	^ anOrderedCollection