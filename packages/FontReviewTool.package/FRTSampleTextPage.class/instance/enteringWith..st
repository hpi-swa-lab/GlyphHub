lifecycle
enteringWith: aSampleText
	
	fontSelectCompletion loadFrom: self backend.

	self sampleText: aSampleText.
	titleLabel text: self sampleText title.
	authorLabel text: 'Sample Text by ', self sampleText author username.
	sampleTextWidget pointSize: self topLevel standardPointSize.
	sampleTextWidget text: self sampleText text.
	self resetFont