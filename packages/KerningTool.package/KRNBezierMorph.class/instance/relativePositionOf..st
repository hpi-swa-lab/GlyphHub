event handling
relativePositionOf: aSubmorph
	^ (aSubmorph position - self position) + ((aSubmorph width // 2) @ (aSubmorph height // 2))