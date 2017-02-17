as yet unclassified
initialize
	super initialize.
	
	activeNotifications := OrderedCollection new.
	
	self
		" note: inherits vertical: true "
		layoutPolicy: BTBoxLayout new;
		size: 600 asPoint;
		withPadding;
		colorType: #secondary;
		color: self colorScheme background;
		beSticky