initialize-release
initialize

	super initialize.
	
	self
		wrap: #word_char;
		placeholder: 'Empty Paragraph';
		multiLine: true