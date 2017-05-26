accessing
firstParagraph

	self paragraphs
		ifNotEmpty: [^ self paragraphs first]
		ifEmpty: [^ nil]