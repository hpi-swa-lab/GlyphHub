as yet unclassified
updateNeighboringHandles: aCoordinateDeltaPoint

	self previousCurveDo: [:curve |
		curve endPointMorph coordinates: self coordinates.
		curve controlPoint2Morph translateBy: aCoordinateDeltaPoint].
	self curveDo: [:curve | curve controlPoint1Morph translateBy: aCoordinateDeltaPoint]