as yet unclassified
initialize
	super initialize.
	
	activeNotifications := OrderedCollection new.
	
	self
		hResizing: #rigid;
		vResizing: #rigid;
		size: 500 asPoint;  
		withPadding;
		colorType: #secondary;  
		color: self colorScheme background;
		beSticky