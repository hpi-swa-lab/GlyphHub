as yet unclassified
updateNeighboringHandles: aCoordinateDeltaPoint

	self nextCurveDo: [:curve |
		curve startPointMorph coordinates: self coordinates.
		curve controlPoint1Morph translateBy: aCoordinateDeltaPoint].
	self curveDo: [:curve | curve controlPoint2Morph translateBy: aCoordinateDeltaPoint]