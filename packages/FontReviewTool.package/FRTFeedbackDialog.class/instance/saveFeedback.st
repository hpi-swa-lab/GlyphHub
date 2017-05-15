callbacks
saveFeedback

	feedbackTextArea text ifEmpty: [self add: (BTAlert text: 'Text can''t be empty'). ^ self].

	((((FRTFeedback new
		text: feedbackTextArea text;
		author: self parentTopLevel user) saveTo: self parentTopLevel backend)
			then: [:feedback | self parentTopLevel backend uploadForm: form toFeedback: feedback id])
				then: [:feedback | self accept: feedback])
				catch: [self add: (BTAlert text: 'Saving Feedback failed' type: #danger)]