as yet unclassified
initialize
	super initialize.
	
	activeNotifications := OrderedCollection new.
	
	self
		" note: inherits vertical: true "
		layoutPolicy: BTBoxLayout new;
		align: #(start start);
		size: 600 asPoint;
		withPadding;
		colorType: #secondary;
		color: self colorScheme background;
		beSticky