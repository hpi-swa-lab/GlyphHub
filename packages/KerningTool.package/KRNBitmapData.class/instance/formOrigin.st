as yet unclassified
formOrigin
	^self innerBounds origin - (form extent - (originalForm extent * self formScale) / 2) + (transform offset * self formScale)