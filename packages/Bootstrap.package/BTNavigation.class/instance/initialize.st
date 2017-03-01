as yet unclassified
initialize
	super initialize.
	
	self
		withLayout;
		tabSwitchedDo: [:new :old |
			old ifNotNil: [ old active: false ].
			new active: true ]
	