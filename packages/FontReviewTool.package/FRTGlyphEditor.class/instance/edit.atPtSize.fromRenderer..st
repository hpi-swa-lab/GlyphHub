as yet unclassified
edit: aGlyphNameString atPtSize: aNumber fromRenderer: aRenderer
	
	| maxY unitsPerEm glif |
	outline := KRNOutline new.
	glif := aRenderer loadedGlifs at: aGlyphNameString.
	unitsPerEm := aRenderer fontinfo at: 'unitsPerEm'.
	
	self add: outline.
	
	(glif firstTagNamed: #outline) tagsNamed: #contour do: [:contour |
		contour elements size < 2 ifFalse: [ | contourWidget |
			contourWidget := KRNContour new.
			contour elements do: [:element |
				contourWidget points add: {
					(self coordinatesFromNode: element) * aNumber / 16.6.
					self pointTypeMappings at: (self typeFromNode: element)}].
			
			contourWidget points first second == #cubicOffCurve ifTrue: [
				contourWidget points addFirst: contourWidget points removeLast].
			outline addContour: contourWidget]].
	
	maxY := -100000000.
	outline syncMorphs.
	outline submorphsDo: [:contour |
		contour points do: [:point |
			maxY := point first y max: maxY]].
	
	self flag: #todo. " calculate the actual dimensions "
	self extent: ((glif firstTagNamed: #advance) attributeAt: #width ifAbsent: [0]) / unitsPerEm * aNumber @ aNumber.
	self minSize: self extent.  
	
	outline position: self position + (0 @ (aRenderer fontinfo at: 'ascender') / unitsPerEm * aNumber) - (0 @ maxY / 64).