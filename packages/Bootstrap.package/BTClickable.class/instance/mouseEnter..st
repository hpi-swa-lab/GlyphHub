event handling
mouseEnter: anEvent
	self
		hovered: true;
		triggerHovered: true event: anEvent;
		changed