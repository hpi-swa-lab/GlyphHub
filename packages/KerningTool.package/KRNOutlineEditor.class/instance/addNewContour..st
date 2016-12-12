as yet unclassified
addNewContour: aPoint
	| newContour |
	newContour := (KRNContour new
		extent: 600 asPoint;
		addSegment: KRNBezierMorph new;
		position: aPoint; 
		yourself ).
	outline addContour: newContour.
	self selectedContour: newContour