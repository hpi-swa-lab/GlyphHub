as yet unclassified
readElement: anXMLNode
	| first |
	first := anXMLNode.
	^first tag caseOf: {
		[#plist] -> [self readElement: first].
		[#integer] -> [ first contentString asNumber ].
		[#real] -> [ first contentString asNumber ].
		[#true] -> [ true ].
		[#false] -> [ false ].
		[#string] -> [ first contentString ].
		[#date] -> [ self shouldNotImplement ].
		[#data] -> [ self shouldNotImplement ].
		[#array] -> [ self readArray: first ].
		[#dict] -> [ self readDictionary: first ]
	}