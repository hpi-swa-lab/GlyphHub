drawing
createBezierShape
	| shape curve |
	shape := OrderedCollection new.
	curve := ((Bezier3Segment
		from: (self startPoint - self position)
		via: (self controlPoint1 - self position)
		and: (self controlPoint2 -  self position)
		to: (self endPoint -  self position)) asBezier2Segments collect: [ :s | s controlPoints ]) flatten.
	^ shape
		add: curve;
		yourself