as yet unclassified
preferredSize
	| someWidth |
	someWidth := 10 * self class letterWidth.
	
	^self adjustPreferredSize: {someWidth @ self class lineHeight. self singleLineWidth @ self class lineHeight}