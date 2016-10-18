private
pointsForContour: anXMLNode
	| elements previous controlPoints segments |
	elements := anXMLNode elements.
	segments := OrderedCollection new.
	controlPoints := OrderedCollection new.
	previous := self coordFromNode: elements first.
	
	" we have a closed (circular) shape, so first and last points match "
	(self typeFromNode: elements first) = #move ifFalse: [
		elements add: elements first ].

	(self typeFromNode: elements first) = #offcurve ifTrue: [
		elements addFirst: elements last ].
	
	elements allButFirstDo: [ :point | | type coord |
		type := self typeFromNode: point.
		coord := self coordFromNode: point.
		
		type = #line ifTrue: [ segments add: (LineSegment from: previous to: coord) asBezier2Segment ].
		type = #curve ifTrue: [ segments addAll: (Bezier3Segment from: previous via: controlPoints first and: controlPoints second to: coord) asBezier2Segments ].
		type = #qcurve ifTrue: [ segments add: (Bezier2Segment from: previous via: controlPoints first to: coord) ].
		type = #offcurve
			ifTrue: [ controlPoints add: coord ]
			ifFalse: [ previous := coord. controlPoints removeAll ]].
	
	^(segments collect: [ :s | s controlPoints ]) flatten