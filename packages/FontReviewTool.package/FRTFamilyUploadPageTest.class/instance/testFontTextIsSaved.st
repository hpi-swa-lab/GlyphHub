as yet unclassified
testFontTextIsSaved

	| input text |
	text := 'Text about my font'.
	input := page findInputWithPlaceholder: 'Write something about your font'.
	input text: text.
	
	page chooseFile.
	self simulateFinishUploadWithError: nil.
	
	(self expect: page openFamily) to resolve.
	(self expect: self topLevel openPage) to haveText: text