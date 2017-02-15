as yet unclassified
initialize
	super initialize.
	
	activeNotifications := OrderedCollection new.
	
	self
		layoutPolicy: BTBoxLayout new;
		hResizing: #rigid;
		vResizing: #rigid;
		size: 500 asPoint;  
		withPadding;
		colorType: #secondary;  
		color: self colorScheme background;
		beSticky