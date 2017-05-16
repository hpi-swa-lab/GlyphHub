initialize-release
initialize
	
	super initialize.
	richText
		addEmptyParagraphWithPlaceholder: 'Adhesion' pointSize: 100 deletable: false;
		addEmptyParagraphWithPlaceholder: 'Insert a sentence here' pointSize: 40 deletable: false;
		addEmptyParagraphWithPlaceholder: 'Insert a paragraph here' pointSize: 16 deletable: false;
		addEmptyParagraphWithPlaceholder: 'Try building a document here. Feel free to add more paragraphs' pointSize: 16 deletable: false;
		minimumNumberOfParagraphs: 4.
	self
		align: #(fill start);
		saveButtonVisible: false