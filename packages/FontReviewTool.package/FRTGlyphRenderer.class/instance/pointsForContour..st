helper-contours
pointsForContour: anXMLNode

	| elements previous controlPoints points |
	elements := anXMLNode elements.
	points := OrderedCollection new.
	controlPoints := OrderedCollection new.
	
	" list is circular and starts offcurve, copy last element (must be oncurve) to the front "
	(self typeFromNode: elements first) = #offcurve
		ifTrue: [elements addFirst: elements last]
		ifFalse: [
			" we have a closed (circular) shape, so first and last points match "
			(self typeFromNode: elements first) = #move
				ifFalse: [elements add: elements first]].

	previous := self coordinatesFromNode: elements first.
	
	elements allButFirstDo: [:point | | type coordinates |
		type := self typeFromNode: point.
		coordinates := self coordinatesFromNode: point.
		
		type = #line ifTrue: [points addAll: (self lineFrom: previous to: coordinates)].
		type = #curve ifTrue: [points addAll: (self curveFrom: previous via: controlPoints to: coordinates)].
		type = #qcurve ifTrue: [points addAll: (self qcurveFrom: previous via: controlPoints to: coordinates)].
		type = #offcurve
			ifTrue: [controlPoints add: coordinates]
			ifFalse: [previous := coordinates. controlPoints removeAll]].
	
	^ points