initialize-release
initialize

	super initialize.
	
	titleField := BTTextAreaWithLabel text: 'Title' placeholder: 'Enter title'.
	textEditor := FRTRichTextEditor new
		addEmptyParagraph;
		when: #saved send: #saveSampleText: to: self;
		yourself.
	
	self
		add: (BTLabel heading: 'Create a sample text');
		add: titleField;
		add: textEditor