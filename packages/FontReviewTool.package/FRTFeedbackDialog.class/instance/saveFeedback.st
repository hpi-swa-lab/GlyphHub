callbacks
saveFeedback

	feedbackTextArea text ifEmpty: [
		page add: (BTAlert text: 'Text can''t be empty' type: #warning) at: 3.
		^ self].

	^ (((FRTFeedback new
		text: feedbackTextArea text;
		author: self parentTopLevel user;
		saveTo: self parentTopLevel backend)
			then: [:feedback | self parentTopLevel backend uploadForm: form toFeedback: feedback id])
			then: [:feedback | self accept: feedback])
			catch: [page add: (BTAlert text: 'Saving Feedback failed' type: #danger) at: 3]