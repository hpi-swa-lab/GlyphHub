as yet unclassified
testToggleWinding
	| contour oldEndPoint oldStartPoint newEndPoint newStartPoint |
	contour := KRNContour new
		extent: 600 asPoint;
		addSmoothSegmentFrom: 100@50 to: 50@50;
		addSmoothSegmentFrom: 50@50 to: 0@50;
		yourself.
		
	oldStartPoint := contour submorphs first startPoint.
	oldEndPoint := contour submorphs last endPoint.
	
	contour toggleWinding.
	
	newStartPoint := contour submorphs first startPoint.
	newEndPoint := contour submorphs last endPoint.
	
	self assert: oldStartPoint equals: newEndPoint.
	self assert: oldEndPoint equals: newStartPoint   