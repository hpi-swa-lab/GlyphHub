testing
testBiographyIsSaved

	| input text |
	text := 'Text about me'.
	input := page findInputWithPlaceholder: 'Write something about yourself'.
	input text: text.
	page chooseFile.
	self simulateFinishUploadWithError: nil.
	
	(self expect: page openFamily) to resolve.
	(self expect: self topLevel user biography) to equal: text