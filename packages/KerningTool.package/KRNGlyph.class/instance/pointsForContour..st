private
pointsForContour: anXMLNode
	| elements previous controlPoints points |
	elements := anXMLNode elements.
	points := OrderedCollection new.
	controlPoints := OrderedCollection new.
	
	" list is cicular and starts offcurve, copy last element (must be oncurve) to the front "
	(self typeFromNode: elements first) = #offcurve
		ifTrue: [ elements addFirst: elements last ]
		ifFalse: [
			" we have a closed (circular) shape, so first and last points match "
			(self typeFromNode: elements first) = #move
				ifFalse: [ elements add: elements first ]].

	previous := self coordFromNode: elements first.
	
	elements allButFirstDo: [ :point | | type coord |
		type := self typeFromNode: point.
		coord := self coordFromNode: point.
		
		type = #line ifTrue: [ points addAll: (self lineFrom: previous to: coord) ].
		type = #curve ifTrue: [ points addAll: (self curveFrom: previous via: controlPoints to: coord) ].
		type = #qcurve ifTrue: [ points addAll: (self qcurveFrom: previous via: controlPoints to: coord) ].
		type = #offcurve
			ifTrue: [ controlPoints add: coord ]
			ifFalse: [ previous := coord. controlPoints removeAll ]].
	
	^points