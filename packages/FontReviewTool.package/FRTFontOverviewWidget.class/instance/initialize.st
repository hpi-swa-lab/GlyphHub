initialize-release
initialize

	super initialize.
	
	self
		vertical: false;
		expand: true;
		spacing: BTWidget spacing * 2;
		add: self initializeSampleTextArea;
		add: self initializeAboutArea