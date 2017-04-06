helper-contours
curveFrom: startPoint via: controlPoints to: endPoint

	^ ((Bezier3Segment from: startPoint via: controlPoints first and: controlPoints second to: endPoint)
		asBezier2Segments
		collect: [ :s | s controlPoints ]) flatten