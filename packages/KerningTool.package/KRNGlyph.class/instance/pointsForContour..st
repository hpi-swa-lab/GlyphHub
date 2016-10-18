private
pointsForContour: anXMLNode
	| type coord closed first segments previousCoord controlPoints elements points |
	points := OrderedCollection new.
	segments := OrderedCollection new.
	controlPoints := OrderedCollection new.
	closed := true.
	first := nil.
	previousCoord := 0 @ 0.
	
	elements := anXMLNode elements.
	(elements first attributeAt: #type ifAbsent: [ #offcurve ]) = #curve ifTrue: [
		elements add: elements removeFirst ].
	
	elements do: [ :point |
		type := point attributeAt: #type.
		coord := (point attributeAt: #x) asNumber @ (point attributeAt: #y) asNumber.
		
		first ifNil: [ first := coord ].
		
		type = #move ifTrue: [
			closed := false ].
		type = #line ifTrue: [
			(point attributeAt: #smooth ifAbsent: [ 'no' ]) = 'yes'
				ifTrue: [ segments add: (LineSegment from: previousCoord to: coord) asBezier2Segment ]
				ifFalse: [ segments add: (Bezier2Segment from: previousCoord via: coord to: coord) ]].
		type = #curve ifTrue: [
			self assert: 2 = controlPoints size.
			segments addAll: (Bezier3Segment from: previousCoord via: controlPoints first and: controlPoints second to: coord) asBezier2Segments ].
		type = #qcurve ifTrue: [
			self assert: 1 = controlPoints size.
			segments add: (Bezier2Segment from: previousCoord via: controlPoints first to: coord) ].
		(type isNil or: [type = #offcurve])
			ifTrue: [ controlPoints add: coord ]
			ifFalse: [ previousCoord := coord. controlPoints removeAll ]].
	
	segments ifNotEmpty: [
		closed ifTrue: [ segments first start: segments last end ].
				points addAll: (segments collect: [ :s | s controlPoints ]) flatten ].

	^points