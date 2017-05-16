initialize-release
feedbackButton

	^ (BTButton label: 'Send feedback')
		align: #(end center);
		colorType: #primary;
		when: #clicked send: #saveFeedback to: self