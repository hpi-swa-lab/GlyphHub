initialize-release
initialize
	
	super initialize.
	richText
		addEmptyParagraphWithPlaceholder: 'Adhesion' pointSize: 100;
		addEmptyParagraphWithPlaceholder: 'Insert a sentence here' pointSize: 40;
		addEmptyParagraphWithPlaceholder: 'Insert a paragraph here' pointSize: 16;
		addEmptyParagraphWithPlaceholder: 'Try building a document here. Feel free to add more paragraphs' pointSize: 16;
		minimumNumberOfParagraphs: 4.
	self
		align: #(fill start);
		saveButtonVisible: false