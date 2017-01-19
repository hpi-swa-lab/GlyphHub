accessing
toggleEditOn: aFlyweight
	(aFlyweight inEditMode) ifFalse: [ | real  maxY|
			maxY := -100000000.
			(aFlyweight renderDataAt: #outline) syncMorphs.
			real := (aFlyweight renderDataAt: #outline).
			real submorphsDo: [:contour | contour points do: [:point | maxY := point first y max: maxY]].
			real position: aFlyweight position + (0@(self font ascender * aFlyweight scale)) - (0@maxY/64).
			aFlyweight addMorphBack: (real)
			]
		ifTrue: [
			(aFlyweight renderDataAt: #outline) syncPoints.
			aFlyweight removeAllMorphs].
	aFlyweight toggleEditMode