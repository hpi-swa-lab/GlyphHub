initialize-release
initialize
	super initialize.

	self 
		withLayout;
		widgets: OrderedCollection new;
		padding: BTWidget spacing