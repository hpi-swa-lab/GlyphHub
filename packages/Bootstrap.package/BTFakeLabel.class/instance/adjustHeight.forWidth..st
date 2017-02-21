as yet unclassified
adjustHeight: height forWidth: width
	| required lines |
	required := self numberOfLetters * self class letterWidth.
	lines := (required / width) ceiling max: 1.
	^lines * self class lineHeight