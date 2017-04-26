displaying
openFor: aTargetWidget event: anEvent

	commitMessageTextArea text: ''.
	self topLevel: aTargetWidget topLevel.
	super openFor: aTargetWidget event: anEvent