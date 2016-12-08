as yet unclassified
addNewContour: aPoint
	outline addContour: (KRNContour new
		extent: 600 asPoint;
		addSegment: KRNBezierMorph new;
		position: aPoint; 
		yourself ) 