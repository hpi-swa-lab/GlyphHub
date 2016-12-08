as yet unclassified
addNewSegment: aPoint
	self selectedContour addSmoothSegmentFrom: self selectedContour lastSubmorph endPoint to: aPoint 