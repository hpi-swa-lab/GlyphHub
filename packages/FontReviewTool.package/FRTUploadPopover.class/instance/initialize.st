initialize-release
initialize

	super initialize.
	
	commitMessageTextArea := BTTextArea new
		multiLine: true;
		placeholder: 'Describe what you changed here ...';
		minSize: 400 @ 0;
		minRows: 5.
	
	self
		spacing: BTWidget spacing;
		vertical: true;
		add: commitMessageTextArea;
		add: ((BTButton label: 'Select File' icon: #cloud_upload)
			colorType: #primary;
			when: #clicked send: #selectFile to: self)