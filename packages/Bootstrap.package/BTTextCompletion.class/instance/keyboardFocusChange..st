as yet unclassified
keyboardFocusChange: weHaveFocus
	super keyboardFocusChange: weHaveFocus.
	
	weHaveFocus
		ifTrue: [ self updateSuggestions ]
		ifFalse: [ suggestions delete ]