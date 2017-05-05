as yet unclassified
selectedPointSize: aNumber

	self selectedParagraph ifNotNilDo: [:paragraph | 
		[paragraph pointSize: aNumber asNumber] on: NumberParserError do: []]