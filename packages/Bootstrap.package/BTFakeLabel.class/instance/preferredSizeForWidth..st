as yet unclassified
preferredSizeForWidth: aNumber
	| linesNat required height min |
	required := self numberOfLetters * self class letterWidth.
	linesNat := (required / (aNumber max: 1)) ceiling max: 1.
	height := linesNat * self class lineHeight.
	min := aNumber @ height.
	
	Transcript show: aNumber; show: ' -> '; show: {min. required @ self class lineHeight max: min}; cr.
	^{min. required @ self class lineHeight max: min}