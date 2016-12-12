as yet unclassified
addNewSegment: aPoint
	self selectedContour deselectEndPointMorph;
		addSmoothSegmentFrom: (self selectedContour lastSubmorph endPoint) to: aPoint;
		selectEndPointMorph