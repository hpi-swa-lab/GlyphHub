displaying
openFor: aTargetWidget event: anEvent

	changeText text: ''.
	self topLevel: aTargetWidget topLevel.
	super openFor: aTargetWidget event: anEvent