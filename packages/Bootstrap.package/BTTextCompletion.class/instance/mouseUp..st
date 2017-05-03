accessing
mouseUp: anEvent

	super mouseUp: anEvent.
	anEvent hand newMouseFocus: suggestionsDropdown