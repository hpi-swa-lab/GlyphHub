as yet unclassified
yellowButtonActivity: shiftState
	shiftState ifTrue: [ self selectedContour canAppendTo ifTrue: [ self addNewLineSegment: ActiveHand position ]]