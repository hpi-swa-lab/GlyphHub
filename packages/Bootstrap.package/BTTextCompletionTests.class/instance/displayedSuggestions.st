as yet unclassified
displayedSuggestions
	| dropdown |
	dropdown := completionWidget instVarNamed: #suggestionsDropdown.
	
	^dropdown submorphs collect: [:dropdownItem | dropdownItem plainText]