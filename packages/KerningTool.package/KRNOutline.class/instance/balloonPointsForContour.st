as yet unclassified
balloonPointsForContour
	| list |
	^self contours collect: [ :contour |
		list := OrderedCollection new.
		contour segmentsDo: [ :type :points |
			type = #conic ifTrue: [ list addAll: (Bezier2Segment from: points first via: points second to: points last) controlPoints ].
			type = #line ifTrue: [ list addAll: ((LineSegment from: points first to: points last) asBezier2Segment controlPoints)].
			type = #cubic ifTrue: [
				list addAll: (((Bezier3Segment from: points first via: points second and: points third to: points last)
					asBezier2Segments
					collect: [ :s | s controlPoints ]) flatten) ]].
		list asPointArray ]