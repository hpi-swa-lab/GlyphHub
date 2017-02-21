as yet unclassified
preferredSizeForWidth: aNumber
	| linesMin linesNat required size width |
	width := aNumber max: self minSize x.
	required := self numberOfLetters * self class letterWidth.
	linesNat := (required / width) ceiling max: 1.
	linesMin := (required / self class sensibleMinWidth) ceiling max: 1.
	size := aNumber @ (linesNat * self class lineHeight).
	
	^{ "self class sensibleMinWidth @ (linesMin * self class lineHeight)."
		  size. size }