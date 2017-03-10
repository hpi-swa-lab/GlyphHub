as yet unclassified
text: aString
	super text: aString.
	
	self add: ((BTIconButton icon: #remove)
		padding: 0@0;
		colorType: #primary;
		when: #clicked send: #triggerDeleted: to: self;
		yourself).
	self spacing: 5