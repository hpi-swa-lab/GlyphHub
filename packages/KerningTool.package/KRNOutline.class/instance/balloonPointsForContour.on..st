as yet unclassified
balloonPointsForContour: aContour on: aStream
	aContour
		segmentsDoLine: [:points |
			aStream nextPutAll: ((LineSegment from: points first to: points last) asBezier2Segment controlPoints)]
	 	cubic: [:points | 
			((Bezier3Segment from: points first via: points second and: points third to: points last)
				asBezier2Segments do: [ :s | aStream nextPutAll: s controlPoints ])]
	 	conic: [:points |
			aStream nextPutAll: (Bezier2Segment from: points first via: points second to: points last) controlPoints ]