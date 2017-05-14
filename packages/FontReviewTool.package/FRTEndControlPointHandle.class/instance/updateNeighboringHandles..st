as yet unclassified
updateNeighboringHandles: aCoordinateDeltaPoint

	self nextCurveDo: [:curve | 
		self adjustSmoothHandle: curve controlPoint1Morph]