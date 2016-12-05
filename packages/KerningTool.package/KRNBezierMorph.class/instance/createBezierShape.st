drawing
createBezierShape
	| shape curve |
	shape := OrderedCollection new.
	curve := ((Bezier3Segment
		from: (self relativePositionOf: self startPoint)
		via: (self relativePositionOf: self controlPoint1)
		and: (self relativePositionOf: self controlPoint2)
		to: (self relativePositionOf: self endPoint)) asBezier2Segments collect: [ :s | s controlPoints ]) flatten.
	^ shape
		add: curve;
		yourself