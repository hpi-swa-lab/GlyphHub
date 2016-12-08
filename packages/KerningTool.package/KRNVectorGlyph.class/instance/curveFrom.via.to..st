private
curveFrom: from via: controlPoints to: to

	^((Bezier3Segment from: from via: controlPoints first and: controlPoints second to: to) asBezier2Segments collect: [ :s | s controlPoints ]) flatten