event handling
processFocusEvent: evt using: dispatcher
	"is needed to make our dropdown dispatch mouse events to it's children (BTDropdownItems)"

	^ dispatcher dispatchFocusEventFully: evt with: self