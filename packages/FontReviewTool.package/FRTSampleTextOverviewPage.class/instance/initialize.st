initialize-release
initialize

	super initialize.
	
	sampleTextList := BTPage column
		minSize: 100 @ 100;
		padding: (Rectangle left: 0 right: BTWidget spacing * 2 top: 0 bottom: 0).
	
	self
		padding: BTWidget spacing * 3;
		add: ((BTButton label: 'Create New Sample Text' icon: #plus)
			when: #clicked send: #openCreateSampleTextPage to: self;
			align: #(end center));
		add: (BTScrollArea new add: sampleTextList)