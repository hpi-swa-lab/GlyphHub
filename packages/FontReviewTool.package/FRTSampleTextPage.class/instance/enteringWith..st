lifecycle
enteringWith: aSampleText
	
	self sampleText: aSampleText.
	titleLabel text: self sampleText title.
	authorLabel text: 'by ', self sampleText author username.
	self resetFont