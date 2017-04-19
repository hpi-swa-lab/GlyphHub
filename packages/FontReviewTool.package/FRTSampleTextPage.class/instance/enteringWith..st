lifecycle
enteringWith: aSampleText
	
	self sampleText: aSampleText.
	titleLabel heading: self sampleText title.
	authorLabel subHeading: 'by ', self sampleText author username.
	self resetFont