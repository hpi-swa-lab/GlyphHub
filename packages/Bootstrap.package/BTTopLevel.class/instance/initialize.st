as yet unclassified
initialize
	super initialize.
	
	activeNotifications := OrderedCollection new.
	
	self
		hResizing: #rigid;
		vResizing: #rigid;
		color: BTWidget backgroundColor;
		beSticky