as yet unclassified
mouseDown: anEvent
	anEvent redButtonPressed  ifTrue: [
		anEvent shiftPressed ifTrue: [
			self selectedContour canAppendTo ifTrue: [
				self addNewSegment: anEvent position
				] ifFalse: [
				self addNewContour: anEvent position ]    
			] ifFalse: [
			self selectedContour: KRNNullContour new ]]