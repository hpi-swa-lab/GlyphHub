as yet unclassified
openCurveEditing: aGlyphWidget
	
	| outlines dialog |
	outlines := aGlyphWidget asEditable pointSize: 512.

	dialog := FRTCurveEditingDialog new
		outlines: outlines.
	(dialog openFor: self topLevel)
		then: [self topLevel displayNotification: 'Changes saved' type: #success. self changed]