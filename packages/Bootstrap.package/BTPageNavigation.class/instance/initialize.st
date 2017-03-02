as yet unclassified
initialize

	super initialize.
	
	self
		stackedContainer: BTStackedContainer new;
		navigationBar: BTNavigation new.
	self navigationBar tabSwitchedDo: [:new | self stackedContainer selectWidgetAt: (self navigationBar submorphs indexOf: new)].
		
	self
		withLayout;
		vertical: true;
		add: self navigationBar;
		add: self stackedContainer