as yet unclassified
createContainer
	^UiContainer new
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		changeTableLayout;  
		listDirection: #topToBottom;
		yourself