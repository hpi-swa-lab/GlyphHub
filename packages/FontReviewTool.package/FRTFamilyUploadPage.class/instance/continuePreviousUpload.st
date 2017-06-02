callback
continuePreviousUpload

	fileSelectButton disabled: true.
	uploadedFileLabel text: 'Processing previously selected file ...'.
	self loadingIndicator visible: true.
	self startPolling