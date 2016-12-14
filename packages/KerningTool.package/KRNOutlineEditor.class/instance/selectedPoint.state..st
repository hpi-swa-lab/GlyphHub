as yet unclassified
selectedPoint: aControlPoint state: aState
	Transcript show: 'bla'; cr.
	aState = #down ifTrue: [
		movingPoint := aControlPoint.
		self selectedContour: aControlPoint contour ].
	aState = #up ifTrue: [
		movingPoint := nil.
		self updateSnappingLines ].
	
	self changed