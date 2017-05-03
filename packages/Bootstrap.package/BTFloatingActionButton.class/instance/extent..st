geometry
extent: aPoint

	| max |
	max := aPoint x max: aPoint y.
	super extent: max asPoint