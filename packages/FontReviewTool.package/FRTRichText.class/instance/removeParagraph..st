paragraphs
removeParagraph: aParagraph

	self focusParagraph: (aParagraph submorphBefore ifNil: [aParagraph submorphAfter]).
	aParagraph delete