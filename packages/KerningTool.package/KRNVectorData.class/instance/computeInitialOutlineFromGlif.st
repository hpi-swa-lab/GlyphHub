accessing
computeInitialOutlineFromGlif
	| outline c |
	outline := KRNOutline new.
	
	(glif firstTagNamed: #outline) tagsNamed: #contour do: [ :contour |
		contour elements size < 2 ifFalse: [
			c := KRNContour new.
			contour elements do: [ :element |
				c points add: {
					(self coordinatesFromNode: element).
					self class pointTypeMappings at: (self typeFromNode: element)} ].
			
			c points first second == #cubicOffCurve ifTrue: [ c points addFirst: c points removeLast ].
			outline addContour: c ]].
	
	self outline: outline