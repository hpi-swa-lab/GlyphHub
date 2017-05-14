as yet unclassified
createBezierShape

	^ {((Bezier3Segment
		from: (startPointMorph center - self position)
		via: (controlPoint1Morph center - self position)
		and: (controlPoint2Morph center -  self position)
		to: (endPointMorph center -  self position)) asBezier2Segments collect: [:s | s controlPoints]) flatten}