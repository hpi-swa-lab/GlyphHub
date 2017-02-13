as yet unclassified
displaySuggestions: aCollection
	suggestions removeAllMorphs.
	activeSuggestion := 0.

	aCollection
		ifEmpty: [ ^suggestions delete ]
		ifNotEmpty: [ self showSuggestions ].

	topHit := aCollection
		detect: [ :suggestion | suggestion first asLowercase beginsWith: self text asLowercase ]
		ifNone: [ nil ].

	aCollection do: [ :suggestion |
		suggestions add: (BTDropdownItem label: (self markupForResult: suggestion first) action: suggestion second)].

	suggestions height: 0