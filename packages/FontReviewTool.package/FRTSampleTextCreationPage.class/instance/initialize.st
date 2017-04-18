as yet unclassified
initialize

	super initialize.
	
	titleField := BTTextAreaWithLabel text: 'Title' placeholder: 'Enter title'.
	textField := BTTextAreaWithLabel text: 'Text' placeholder: 'Enter text'.
	textField textArea
		multiLine: true;
		minRows: 5.
	
	self
		add: (BTLabel heading: 'Create a sample text');
		add: titleField;
		add: textField;
		add: ((BTButton text: 'Save')
			colorType: #primary;
			align: #(end start);
			when: #clickedNoEvent send: #saveSampleText to: self)