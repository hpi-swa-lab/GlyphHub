testing
testReenteringShowsWaitingForUpload
	
	| title titleInput |
	title := 'My Special Font'.
	titleInput := page findInputWithPlaceholder: 'Family Name'.
	titleInput text: ''.
	self type: title into: titleInput.
	(self expect: page saveSettings) to resolve.
	
	self enterPage.
	(self expect: page) to haveText: 'My Special Font'