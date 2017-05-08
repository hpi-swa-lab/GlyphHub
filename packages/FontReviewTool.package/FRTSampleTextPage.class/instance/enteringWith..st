lifecycle
enteringWith: aSampleText
	
	fontSelectCompletion loadFrom: self backend.

	self sampleText: aSampleText.
	titleLabel text: self sampleText title.
	authorLabel text: 'Sample Text by ', self sampleText author username.
	sampleTextWidget
		sampleText: self sampleText;
		backend: self backend.
	self resetFont