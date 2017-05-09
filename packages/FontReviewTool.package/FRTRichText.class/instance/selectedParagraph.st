paragraphs
selectedParagraph

	^ selectedParagraph ifNil: [self submorphs ifNotEmptyDo: #first ifEmpty: []]