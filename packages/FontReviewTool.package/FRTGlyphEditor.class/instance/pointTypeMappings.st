as yet unclassified
pointTypeMappings

	self flag: #TODO. "need to find out whether offcurve is conic or cubic"
	^ {
		#line -> #onCurve.
		#curve -> #onCurve.
		#qcurve -> #onCurve.
		#move -> #onCurve.
		#offcurve -> #cubicOffCurve
	} as: Dictionary