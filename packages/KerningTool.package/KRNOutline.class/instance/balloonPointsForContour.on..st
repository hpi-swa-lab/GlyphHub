as yet unclassified
balloonPointsForContour: aContour on: aStream
	aContour
		segmentsDoLine: [:points |
			aStream nextPutAll: (LineSegment from: points first floor to: points last floor) asBezier2Segment controlPoints]
	 	cubic: [:points | 
			(Bezier3Segment from: points first floor via: points second floor and: points third floor to: points last floor)
				asBezier2Segments do: [ :s | aStream nextPutAll: s controlPoints ]]
	 	conic: [:points |
			aStream nextPutAll: (Bezier2Segment from: points first floor via: points second floor to: points last floor) controlPoints ]