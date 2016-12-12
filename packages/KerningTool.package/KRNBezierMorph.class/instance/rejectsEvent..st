event handling
rejectsEvent: anEvent
	" since we can have overlapping bezier curves at any point, we have to make sure the initial
	  mousedown doesn't get absorbed by an otherwise empty sibling curve "
	anEvent type = #mouseDown ifFalse: [ ^false ].
	^(self hasHandleAt: anEvent position) not