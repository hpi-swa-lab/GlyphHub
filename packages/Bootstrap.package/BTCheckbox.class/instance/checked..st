accessing
checked: aBoolean

	checked := aBoolean.
	
	self
		icon: (checked ifTrue: [#check] ifFalse: [#none]);
		changed;
		triggerToggled: aBoolean