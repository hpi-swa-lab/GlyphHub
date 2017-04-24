initialize-release
initialize

	super initialize.
	
	preview := FRTGlyphWidget new
		centered: true.
	inputArea := (BTTextArea placeholder: 'Start typing!')
			when: #confirmed send: #updatePreview: to: self.
	
	self
		add: (BTLabel heading: 'Write something here, see how it looks and comment on it!');
		add: inputArea;
		add: preview;
		add: (BTButton new
			text: 'Create New Thread';
			colorType: #primary;
			when: #clicked send: #createNewThread to: self)