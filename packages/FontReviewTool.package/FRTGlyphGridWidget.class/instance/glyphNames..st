accessing
glyphNames: aCollection

	glyphNames := aCollection.
	
	self glyphNames do: [:glyphName | | glyph label |
		glyph := (FRTGlyphWidget newWithRenderer: renderer)
			pointSize: self pointSize;
			glyphNames: {glyphName};
			centered: true.
		
		label := (BTLabel small: glyphName) ellipsize: #middle.
		
		self add: (FRTGlyphGridItemWidget new
			when: #clicked send: #openGlyph: to: self with: glyphName;
			add: glyph;
			add: label)]