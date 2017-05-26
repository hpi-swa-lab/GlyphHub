testing
testTitleIsSaved

	| title titleInput |
	page chooseFile.
	
	title := 'My Special Font'.
	titleInput := page findInputWithPlaceholder: 'Family Name'.
	titleInput text: ''.
	self type: title into: titleInput.
	(self expect: page saveSettings) to resolve.
	
	self simulateFinishUploadWithError: nil.
	
	(self expect: page openFamily) to resolve.
	
	(self expect: self topLevel openPage) to haveText: title