as yet unclassified
pointTypeMappings
	^{
		#line -> #onCurve.
		#curve -> #onCurve.
		#qcurve -> #onCurve.
		#move -> #onCurve.
		" TODO need to find out whether it's conic of cubic "
		#offcurve -> #cubicOffCurve
	} as: Dictionary