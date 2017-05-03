lifecycle
enteringWith: aSampleText
	
	self sampleText: aSampleText.
	titleLabel text: self sampleText title.
	authorLabel text: 'by ', self sampleText author username.
	sampleTextWidget pointSize: self topLevel standardPointSize.
	sampleTextWidget text: self sampleText text.
	self resetFont