as yet unclassified
syncPoints
	self contours do: [ :contour |
		contour
			syncPoints;
			removeAllMorphs ]