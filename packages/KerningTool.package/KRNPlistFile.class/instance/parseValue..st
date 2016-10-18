as yet unclassified
parseValue: aCollection
	| first |
	first := aCollection first.
	^first tag caseOf: {
		[#integer] -> [ first contentString asNumber ].
		[#real] -> [ first contentString asNumber ].
		[#true] -> [ true ].
		[#false] -> [ false ].
		[#string] -> [ first contentString ].
		[#date] -> [ self shouldNotImplement ].
		[#data] -> [ self shouldNotImplement ].
		[#array] -> [ " TODO " ].
		[#dict] -> [ self parseValueDict: first into: OrderedDictionary new ]
	}