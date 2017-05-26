accessing
displaySampleTextIfNotEmpty: aSampleText

	| sampleTextArray |
	sampleTextArray := Json readFrom: aSampleText text readStream.
	
	sampleTextArray ifNotEmpty: [
		self fromJson: sampleTextArray].
	
	self saveButtonVisible: aSampleText author id = self topLevel user id.
	self updateToolbar