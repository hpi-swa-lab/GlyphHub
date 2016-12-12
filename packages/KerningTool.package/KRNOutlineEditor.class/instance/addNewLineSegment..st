as yet unclassified
addNewLineSegment: aPoint
	self deselectPointFrom: self selectedContour.
	self selectedContour addLineSegmentFrom: self selectedContour lastSubmorph endPoint to: aPoint.
	self selectPointFrom: self selectedContour