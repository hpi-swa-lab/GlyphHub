as yet unclassified
initialize

	super initialize.
	
	sampleTextList := BTPage column.
	
	self
		padding: BTWidget spacing * 3;
		add: ((BTButton label: 'Create New Sample Text' icon: #plus)
			when: #clickedNoEvent send: #openCreateSampleTextPage to: self;
			align: #(end center));
		add: sampleTextList