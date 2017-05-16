mock-data
uploadForm: aForm toFeedback: anIdNumber

	fileUploads at: 'feedback/', anIdNumber asString put: aForm.
	
	^ BTPromise unit: aForm