initialize-release
initialize

	super initialize.
	
	familyNameBox := BTTextAreaWithLabel text: 'Font Family Name'.
	alertArea := BTPage column.
	
	self
		add: (BTLabel heading: 'Upload new Project');
		add: familyNameBox;
		add: self uploadArea;
		add: self scriptTagArea;
		add: (((BTButton text: 'Create Project')
			colorType: #primary;
			when: #clickedNoEvent send: #tryUpload to: self;
			yourself) align: #(end start));
		add: alertArea