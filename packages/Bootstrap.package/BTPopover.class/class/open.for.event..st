as yet unclassified
open: aContentWidget for: aTargetWidget event: anEvent
	  ^self new
		add: aContentWidget;
		openFor: aTargetWidget event: anEvent;
		yourself