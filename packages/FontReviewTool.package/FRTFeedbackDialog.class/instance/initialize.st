initialize-release
initialize

	super initialize.
	
	feedbackTextArea := BTTextArea new
		multiLine: true;
		placeholder: 'Descibe the problem...';
		minSize: 300 @ 0;
		minRows: 3.
	
	page := (BTPage new
		padding: BTWidget spacing;
		add: feedbackTextArea;
		add: self feedbackButton).
	
	self
		title: 'Report a bug';
		add: page