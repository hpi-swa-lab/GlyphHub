as yet unclassified
keyboardFocusChange: weHaveFocus
	super keyboardFocusChange: weHaveFocus.
	
	weHaveFocus ifFalse: [ self delete ]