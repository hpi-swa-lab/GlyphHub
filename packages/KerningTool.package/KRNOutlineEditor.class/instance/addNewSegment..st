as yet unclassified
addNewSegment: aPoint
	self deselectPointFrom: self selectedContour.
	self selectedContour addSmoothSegmentFrom: self selectedContour lastSubmorph endPoint to: aPoint.
	self selectPointFrom: self selectedContour