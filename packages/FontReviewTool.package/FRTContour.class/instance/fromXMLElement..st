as yet unclassified
fromXMLElement: anXMLNode

	| points previous controlPoints previousSmooth |
	points := self pointsFromNode: anXMLNode.
	controlPoints := OrderedCollection new.
	self closed: (self typeFromNode: points first) ~~ #move.
	
	previous := self coordinatesFromNode: points first.
	previousSmooth := self nodeSmooth: points first.
	
	points allButFirstDo: [ :point | | type coord |
		type := self typeFromNode: point.
		coord := self coordinatesFromNode: point.
		
		type = #line ifTrue: [FRTLine parent: self from: previous to: coord].
		type = #curve ifTrue: [
			(FRTCurve parent: self from: previous via: controlPoints  to: coord)
				startSmooth: previousSmooth;
				endSmooth: (self nodeSmooth: point);
				yourself].
		type = #qcurve ifTrue: [self error: 'qcurve is currently not implemented'].
		type = #offcurve
			ifTrue: [controlPoints add: coord]
			ifFalse: [
				previous := coord.
				controlPoints removeAll]]