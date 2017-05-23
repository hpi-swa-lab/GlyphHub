as yet unclassified
testLoadingIndicator
	
	(self expect: (page loadingIndicator)) to not beVisible.
	
	(self expect: page chooseFile) to resolve.
	(self expect: (page loadingIndicator)) to beVisible.
	self simulateFinishUploadWithError: nil.
	(self expect: (page loadingIndicator)) to not beVisible.
	
	self enterPage.
	(self expect: page chooseFile) to resolve.
	(self expect: (page loadingIndicator)) to beVisible.
	self simulateFinishUploadWithError: 'Something went wrong!'.
	(self expect: (page loadingIndicator)) to not beVisible