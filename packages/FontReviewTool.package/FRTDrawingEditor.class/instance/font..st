accessing
font: aFont

	font := aFont.
	
	aFont loadAllGlyphNames then: [:list |
		glyphImport suggestionsList: list]