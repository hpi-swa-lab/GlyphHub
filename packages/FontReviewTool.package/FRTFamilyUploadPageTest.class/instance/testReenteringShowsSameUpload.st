testing
testReenteringShowsSameUpload
	
	(self expect: page) to not haveText: 'Uploading '.
	
	(self expect: page chooseFile) to resolve.
	(self expect: page) to haveText: 'Uploading '.
	
	self enterPage.
	(self expect: page) to haveText: 'Processing previously selected file ...'