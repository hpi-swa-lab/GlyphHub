paragraphs
removeParagraph: aParagraph

	self submorphs size > self minimumNumberOfParagraphs ifTrue: [
		self focusParagraph: (aParagraph submorphBefore ifNil: [aParagraph submorphAfter]).
		aParagraph delete]