initialize-release
initializeFeedbackButton

	feedbackButton := ((BTButton label: 'Got a problem?' icon: #bug)
		colorType: #danger;
		small;
		when: #clicked send: #openFeedbackDialog to: self;
		align: #(start start))