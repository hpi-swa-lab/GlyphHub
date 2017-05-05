as yet unclassified
font: aFont

	font := aFont.
	
	preview font: aFont.
	glyph1 font: aFont.
	glyph2 font: aFont.
	
	glyph1 loadList then: [:list |
		glyph2 suggestionsList: list]