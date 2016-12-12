as yet unclassified
addNewLineSegment: aPoint
	self selectedContour deselectEndPointMorph;
		addLineSegmentFrom: (self selectedContour lastSubmorph endPoint) to: aPoint;
		selectEndPointMorph