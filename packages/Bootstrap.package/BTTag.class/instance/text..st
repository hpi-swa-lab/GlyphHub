accessing
text: aString
	super text: aString.
	
	self add: ((BTIconButton icon: #remove)
		padding: 0@0;
		colorType: #primary;
		when: #clickedWithEvent send: #triggerDeleted: to: self;
		yourself).
	self spacing: 5