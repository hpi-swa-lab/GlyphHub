callbacks
openFeedbackDialog

	^ (FRTFeedbackDialog new openFor: self)
		then: [self topLevel displayNotification: 'Feedback submitted' type: #success]