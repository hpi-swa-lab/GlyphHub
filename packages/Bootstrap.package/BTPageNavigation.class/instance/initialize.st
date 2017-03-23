initialize-release
initialize

	super initialize.
	
	self
		stackedContainer: BTStackedContainer new;
		navigationBar: BTNavigation new.
	self navigationBar when: #tabSwitched evaluate: [ :new :old |
		self stackedContainer selectWidgetAt: (self navigationBar submorphs indexOf: new) ].
		
	self
		withLayout;
		vertical: true;
		add: self navigationBar;
		add: self stackedContainer