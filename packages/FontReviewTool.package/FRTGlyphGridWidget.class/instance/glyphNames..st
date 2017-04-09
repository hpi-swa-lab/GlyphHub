accessing
glyphNames: aCollection

	glyphNames := aCollection.
	
	self glyphNames do: [:glyphName | | glyph label |
		glyph := (FRTGlyphWidget newWithRenderer: renderer)
			pointSize: 36;
			glyphNames: {glyphName};
			centered: true.
		
		label := (BTLabel small: glyphName) ellipsize: #middle.
		self add: (FRTGlyphGridItemWidget new
				when: #clickedNoEvent send: #openGlyph: to: self with: glyphName;
				add: glyph;
				add: label)]