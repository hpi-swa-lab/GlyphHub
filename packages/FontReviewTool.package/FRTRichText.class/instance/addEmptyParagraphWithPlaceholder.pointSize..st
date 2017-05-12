paragraphs
addEmptyParagraphWithPlaceholder: aString pointSize: aPtSizeNumber

	self addParagraph: (FRTParagraph new 
		default;
		placeholder: aString;
		pointSize: aPtSizeNumber)