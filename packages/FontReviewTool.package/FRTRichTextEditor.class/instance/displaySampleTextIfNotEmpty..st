updating
displaySampleTextIfNotEmpty: aSampleText

	self fromJsonString: aSampleText text.
	
	self saveButtonVisible: aSampleText author id = self topLevel user id.
	self updateToolbar