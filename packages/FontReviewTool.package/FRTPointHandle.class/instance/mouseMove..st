as yet unclassified
mouseMove: anEvent

	anEvent redButtonPressed ifTrue: [ | delta |
		delta := anEvent position - self formerPosition.
		self
			formerPosition: anEvent position;
			coordinates: self coordinates + (toFontUnits transformDirection: delta);
			changed: #handleMoved]