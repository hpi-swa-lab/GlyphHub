lifecycle
enteringWith: aSampleText
	
	self
		sampleText: aSampleText;
		setLabels.
	
	fontSelectCompletion loadFrom: self backend.
	
	self sampleTextWidget
		sampleText: self sampleText;
		backend: self backend.

	self resetFont