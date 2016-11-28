accessing
outline
	| outline c form |
	outline := KRNOutline new.
	
	(glif firstTagNamed: #outline) tagsNamed: #contour do: [ :contour |
		contour elements size < 2 ifFalse: [
			c := KRNContour new.
			contour elements do: [ :element |
				c points add: {
					((self coordFromNode: element) * self ptSize * 64 / self font unitsPerEm) floor.
					self class pointTypeMappings at: (self typeFromNode: element)} ].
			outline addContour: c ]].
	
	form := Form extent: (self advance x @ self font height * self scale) ceiling depth: 32.
	"KRNFtRender renderContours: outline on: form at: (0 @ self font ascender * self scale) floor."
	
	^outline