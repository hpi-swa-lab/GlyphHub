running
simulateFinishUploadWithError: anErrorString
	
	self topLevel simulateFinishUploadFor: page family error: anErrorString.
	(self expect: page pollStatus) to resolve