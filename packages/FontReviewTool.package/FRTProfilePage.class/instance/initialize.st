initialize-release
initialize

	super initialize.
	
	page := BTPage column.
	
	self add: (BTScrollArea new add: (page
		add: self initializeHeadingArea))