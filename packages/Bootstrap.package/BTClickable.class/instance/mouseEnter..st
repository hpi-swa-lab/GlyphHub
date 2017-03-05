as yet unclassified
mouseEnter: anEvent
	self
		triggerHovered: true event: anEvent;
		hovered: true;
		changed