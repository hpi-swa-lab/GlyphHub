as yet unclassified
initialize
	super initialize.
	
	selectedDo := [ :action :label | ].
	
	self
		padding: 1 @ 8;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		changeTableLayout;
		listDirection: #topToBottom