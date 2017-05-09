initialize-release
initializeWithRenderer: aFRTRenderer

	self initialize.
	glyphWidget := (FRTGlyphWidget newWithRenderer: aFRTRenderer)
		centered: true