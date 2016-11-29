as yet unclassified
balloonPointsForOutline
	^ self contours collect: [:contour |
		self balloonPointsForContour: contour]  
