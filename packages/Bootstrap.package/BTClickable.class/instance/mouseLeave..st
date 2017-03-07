event handling
mouseLeave: anEvent
	hadMouseDown := false.
	
	self
		hovered: false;
		triggerHovered: false event: anEvent;
		changed