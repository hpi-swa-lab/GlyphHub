initialize-release
initialize
	super initialize.
	
	self
		add: (BTLabel heading: 'Upload new Project');
		add: (BTTextAreaWithLabel text: 'Name');
		add: self uploadArea;
		add: self scriptTagArea;
		add: (((BTButton text: 'Create Project') colorType: #primary) align: #(end start))