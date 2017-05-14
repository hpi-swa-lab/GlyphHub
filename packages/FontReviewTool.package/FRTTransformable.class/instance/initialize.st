as yet unclassified
initialize

	super initialize.
	
	toPosition := MatrixTransform2x3 identity.
	toFontUnits := MatrixTransform2x3 identity.
	lockLayoutChanged := false