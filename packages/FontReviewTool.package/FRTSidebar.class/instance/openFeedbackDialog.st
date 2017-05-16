callbacks
openFeedbackDialog

	^ (FRTFeedbackDialog new openFor: self topLevel)
		then: [self topLevel displayNotification: 'Feedback submitted' type: #success]