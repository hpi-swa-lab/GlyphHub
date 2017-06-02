testing
testUploadingUnblocksOnError
	
	| uploadButton |
	uploadButton := page findWidgetOfKind: BTButton labelled: 'Select your .glyphs or .ufo.zip to upload.'.
	
	(self expect: page chooseFile) to resolve.
	
	self simulateFinishUploadWithError: 'Something went wrong'.
	(self expect: page pollStatus) to resolve.
	
	(self expect: uploadButton disabled) to be: false.
	(self expect: page) to haveText: 'Something went wrong'