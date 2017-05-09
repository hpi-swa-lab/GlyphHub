paragraphs
selectedPointSize: aNumberOrString

	self selectedParagraph ifNotNilDo: [:paragraph | 
		[paragraph pointSize: aNumberOrString asNumber] on: NumberParserError do: []]