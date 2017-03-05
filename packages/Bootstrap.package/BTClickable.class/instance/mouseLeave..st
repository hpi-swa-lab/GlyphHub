as yet unclassified
mouseLeave: anEvent
	self
		triggerHovered: false event: anEvent;
		hovered: false;
		changed