initialize-release
initialize

	super initialize.
	
	sampleTextList := BTPage column minSize: 100 @ 100.
	
	self
		padding: BTWidget spacing * 3;
		add: ((BTButton label: 'Create New Sample Text' icon: #plus)
			when: #clicked send: #openCreateSampleTextPage to: self;
			align: #(end center));
		add: (BTScrollArea new add: sampleTextList)