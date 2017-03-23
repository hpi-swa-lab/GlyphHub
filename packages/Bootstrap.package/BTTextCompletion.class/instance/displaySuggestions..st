suggestions
displaySuggestions: aCollection
	suggestions removeAllMorphs.
	activeSuggestion := 0.
	
	topHit := aCollection
		detect: [ :suggestion | suggestion first asLowercase beginsWith: self text asLowercase ]
		ifNone: [ nil ].
	
	aCollection
		ifEmpty: [ ^suggestions delete ]
		ifNotEmpty: [ self openSuggestionPopup ].
	
	aCollection do: [ :suggestion |
		suggestions add: (BTDropdownItem label: (self markupForResult: suggestion first) action: suggestion second)].
	
	suggestions height: 0