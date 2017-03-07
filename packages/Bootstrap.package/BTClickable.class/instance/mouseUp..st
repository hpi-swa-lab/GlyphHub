event handling
mouseUp: anEvent
	(self containsPoint: anEvent position)
		ifTrue: [
			hadMouseDown ifTrue: [
				self triggerClicked: anEvent.
				hadMouseDown := false ]]
		ifFalse: [
			self mouseLeave: anEvent ]