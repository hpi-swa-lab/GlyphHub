initialize-release
initialize

	super initialize.
	
	self
		deletable: true;
		wrap: #word_char;
		placeholder: 'Empty Paragraph';
		multiLine: true