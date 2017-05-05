as yet unclassified
addParagraph: aParagraph

	aParagraph when: #focused send: #selectedParagraph: to: self with: aParagraph.
	aParagraph when: #removed send: #removeParagraph: to: self with: aParagraph.

	self add: aParagraph