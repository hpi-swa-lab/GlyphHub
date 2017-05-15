initialize-release
initializeFeedbackButton

	feedbackButton := ((BTIconButton icon: #bug)
		colorType: #danger;
		"color: Color red;"
		when: #clicked send: #openFeedbackDialog to: self;
		align: #(start start))