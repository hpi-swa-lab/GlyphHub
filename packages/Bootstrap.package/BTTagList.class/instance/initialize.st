initialize-release
initialize

	super initialize.
	
	tags := OrderedCollection new.
	
	self
		withLayout;
		padding: BTWidget spacing / 2