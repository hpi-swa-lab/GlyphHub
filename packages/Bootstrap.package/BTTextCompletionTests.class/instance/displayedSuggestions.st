as yet unclassified
displayedSuggestions
	| dropdown |
	dropdown := completionWidget instVarNamed: #suggestions.
	
	^dropdown submorphs collect: [ :item | item firstSubmorph plainText ]