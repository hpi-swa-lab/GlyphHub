as yet unclassified
balloonPointsForContour: aCollection
	 | allPoints |
	allPoints := PointArray
		new: aCollection points size * 2 
		streamContents: [:stream |
			(self balloonPointsForContour: aCollection on: stream)].
	^ allPoints