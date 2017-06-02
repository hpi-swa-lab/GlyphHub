testing
testInhibtsLeavingWithUnsavedChanges

	| input text |
	page chooseFile.
	
	text := 'helo font'.
	input := page findInputWithPlaceholder: 'Family Name'.
	self type: text into: input.
	
	" make sure we say no to the question whether we want to leave "
	self topLevel nextConfirmAnswer: false.
	(self expect: (self topLevel openPage: FRTApplicationPage new)) to reject.
	
	(self expect: self topLevel openPage class) to be: FRTFamilyUploadPage.
	input := self topLevel openPage findInputWithPlaceholder: 'Write something about your font'.
	
	(self expect: page) to haveText: text