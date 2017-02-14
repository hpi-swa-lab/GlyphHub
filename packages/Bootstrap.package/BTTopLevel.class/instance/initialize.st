as yet unclassified
initialize
	super initialize.
	
	activeNotifications := OrderedCollection new.
	
	self
		hResizing: #rigid;
		vResizing: #rigid;
		size: 500 asPoint;  
		withPadding;
		color: BTColorScheme secondary background;
		beSticky