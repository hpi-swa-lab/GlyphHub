testing
testSendFeedback

	| dialog problemText feedback |
	self click: self topLevel sidebar feedbackButton.
	
	problemText := 'Halp!!!'.
	dialog := self findDialog: FRTFeedbackDialog labelled: 'Report a Bug'.
	
	(dialog findInputWithPlaceholder: 'Describe your problem ...') text: problemText.
	
	(self expect: dialog saveFeedback) to resolve.
	
	feedback := (FRTFeedback loadAllFrom: self topLevel populate: #()) value onlyElement.
	(self expect: feedback text) to equal: problemText.
	(self expect: (self topLevel fileUploadFor: feedback) class) to be: Form