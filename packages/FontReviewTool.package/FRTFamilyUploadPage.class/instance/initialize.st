initialize-release
initialize

	super initialize.
	
	saveButton := ((BTButton text: 'Save Settings')
		colorType: #primary;
		disabled: true;
		when: #clicked send: #saveSettings to: self;
		yourself) align: #(end start).
	
	familyName := (BTTextArea text: 'Untitled Family')
		placeholder: 'Family Name';
		when: #changed send: #disabled: to: saveButton with: false.
	
	loadingIndicator := BTLoader new
		visible: false.
	
	alertArea := BTPage column.
	
	self
		add: (BTPage row
			add: (BTLabel heading: 'Upload new Project');
			add: BTWidget spacer;
			add: loadingIndicator;
			add: saveButton);
		add: alertArea;
		add: self initializeInputArea