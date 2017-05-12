as yet unclassified
initialize

	super initialize.
	
	feedbackTextArea := BTTextArea new
		multiLine: true;
		placeholder: 'Report a bug...';
		minSize: 300 @ 0;
		minRows: 3.
		
	self
		spacing: BTWidget spacing;
		add: feedbackTextArea;
		add: ((BTButton label: 'Send feedback')
			colorType: #primary;
			when: #clicked send: #saveFeedback to: self)