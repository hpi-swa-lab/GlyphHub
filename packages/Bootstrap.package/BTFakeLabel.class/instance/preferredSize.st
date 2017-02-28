as yet unclassified
preferredSize
	| someWidth |
	someWidth := 10 * self class letterWidth.
	^self adjustPreferredSize: {someWidth @ (self heightForWidth: someWidth) first. self singleLineWidth @ self class lineHeight}