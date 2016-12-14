accessing
allPointsButLinkedOf: aPoint
	^(self contours gather: [ :contour |
		contour submorphs gather: [ :segment |
			segment pointMorphs ]]) copyWithoutAll: (aPoint owner linkedPointsOf: aPoint)