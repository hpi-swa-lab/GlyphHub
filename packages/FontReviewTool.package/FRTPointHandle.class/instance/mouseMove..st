as yet unclassified
mouseMove: anEvent

	anEvent redButtonPressed ifTrue: [ | delta coordinateDelta |
		delta := anEvent position - self formerPosition.
		coordinateDelta := toFontUnits transformDirection: delta.
		
		self
			formerPosition: anEvent position;
			coordinates: self coordinates + coordinateDelta;
			updateNeighboringHandles: coordinateDelta;
			changed: #handleMoved]