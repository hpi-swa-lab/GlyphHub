as yet unclassified
removeParagraph: aParagraph

	self focusParagraph: (aParagraph submorphBefore ifNil: [aParagraph submorphAfter]).
	aParagraph delete