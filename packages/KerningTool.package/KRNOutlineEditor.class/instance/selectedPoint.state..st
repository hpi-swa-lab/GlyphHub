as yet unclassified
selectedPoint: aControlPoint state: aState
	aState = #down ifTrue: [
		movingPoint := aControlPoint.
		self selectedContour: aControlPoint contour ].
	aState = #up ifTrue: [
		movingPoint := nil.
		self updateSnappingLines ].
	
	self changed