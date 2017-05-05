as yet unclassified
selectedParagraph

	^ selectedParagraph ifNil: [self submorphs ifNotEmptyDo: #first ifEmpty: []]