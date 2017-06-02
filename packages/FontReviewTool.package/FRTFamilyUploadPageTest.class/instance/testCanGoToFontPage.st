testing
testCanGoToFontPage

	page chooseFile.
	
	self simulateFinishUploadWithError: nil.
	
	page findWidgetOfKind: BTButton labelled: 'View your Font!'.
	
	(self expect: page openFamily) to resolve.
	(self expect: self topLevel openPage class) to be: FRTFontPage