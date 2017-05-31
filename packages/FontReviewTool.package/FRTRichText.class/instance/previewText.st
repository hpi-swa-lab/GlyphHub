accessing
previewText

	^ self firstParagraph
		ifNotNilDo: #text
		ifNil: ['']