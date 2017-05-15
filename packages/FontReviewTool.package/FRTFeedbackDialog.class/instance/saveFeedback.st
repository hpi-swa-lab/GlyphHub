as yet unclassified
saveFeedback

	(((FRTFeedback new
		text: feedbackTextArea text;
		author: self parentTopLevel user) saveTo: self parentTopLevel backend)
			then: [:feedback | self accept: feedback])
			catch: [self add: (BTAlert text: 'Saving Feedback failed' type: #danger)]