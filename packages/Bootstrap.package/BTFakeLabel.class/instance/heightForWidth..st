as yet unclassified
heightForWidth: aNumber
	| linesNat required |
	required := self numberOfLetters * self class letterWidth.
	linesNat := (required / (aNumber max: 1)) ceiling max: 1.
	
	^{linesNat * self class lineHeight. self class lineHeight}