as yet unclassified
fromXMLElement: anXMLNode pointTransform: aBlock

	| points previous controlPoints previousSmooth |
	points := self pointsFromNode: anXMLNode.
	controlPoints := OrderedCollection new.
	self closed: ((self typeFromNode: points first) ~= #move).
	
	previous := aBlock value: (self coordinatesFromNode: points first).
	previousSmooth := self nodeSmooth: points first.
	
	points allButFirstDo: [ :point | | type coord |
		type := self typeFromNode: point.
		coord := aBlock value: (self coordinatesFromNode: point).
		
		type = #line ifTrue: [self addMorphBack: (FRTLine from: previous to: coord)].
		type = #curve ifTrue: [
			self addMorphBack: ((FRTCurve from: previous via: controlPoints  to: coord)
				startSmooth: previousSmooth;
				endSmooth: (self nodeSmooth: point);
				yourself)].
		type = #qcurve ifTrue: [self error: 'qcurve is currently not implemented'].
		type = #offcurve
			ifTrue: [controlPoints add: coord]
			ifFalse: [
				previous := coord.
				controlPoints removeAll]]