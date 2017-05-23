as yet unclassified
testGoToFontPageAutosaves

	| title titleInput |
	title := 'My Special Font'.
	titleInput := page findInputWithPlaceholder: 'Family Name'.
	titleInput text: ''.
	self type: title into: titleInput.
	
	page chooseFile.
	self simulateFinishUploadWithError: nil.
	
	(self expect: page openFamily) to resolve.
	(self expect: self topLevel openPage font family familyName) to equal: title