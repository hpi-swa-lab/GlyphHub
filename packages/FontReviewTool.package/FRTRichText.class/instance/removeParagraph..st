paragraphs
removeParagraph: aParagraph

	(self submorphs size > self minimumNumberOfParagraphs and: [aParagraph deletable]) ifTrue: [
		self focusParagraph: (aParagraph submorphBefore ifNil: [aParagraph submorphAfter]).
		aParagraph delete]