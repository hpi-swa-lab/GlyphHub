geometry
extent: aPoint

	super extent: aPoint.
	
	icon position: (self position + (aPoint / 2) - (icon actualSize / 2)) floor