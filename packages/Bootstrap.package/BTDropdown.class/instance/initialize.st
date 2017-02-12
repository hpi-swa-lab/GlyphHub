as yet unclassified
initialize
	super initialize.
	
	selectedDo := [ :action | ].
	
	self
		padding: 1 @ 8;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		changeTableLayout;
		listDirection: #topToBottom