as yet unclassified
mouseDown: anEvent
	anEvent redButtonPressed  ifTrue: [
		anEvent shiftPressed ifTrue: [
			self selectedContour ifNil: [
				self addNewContour: anEvent position
				] ifNotNil: [
				self addNewSegment: anEvent position ]    
			] ifFalse: [
			self selectedContour: nil ]].
	anEvent shiftPressed ifTrue: [
		anEvent yellowButtonPressed ifTrue: [
			self addNewLineSegment: anEvent position] ] 