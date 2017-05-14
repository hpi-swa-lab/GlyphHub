as yet unclassified
updateNeighboringHandles: aCoordinateDeltaPoint

	self previousCurveDo: [:curve | 
		self adjustSmoothHandle: curve controlPoint2Morph]