accessing
glyphNames: aCollection

	glyphNames := aCollection.
	(self topLevel backend loadWhere: #glyphName equals: aCollection into: FRTGlyph populate: #('threadGlyphAssociations'))
		then: [ :loadedGlyphs |
			loadedGlyphs do: [:glyph | | glyphWidget |
				glyphWidget := (FRTGlyphWidget newWithRenderer: renderer)
					pointSize: self pointSize;
					glyph: glyph;
					centered: true.

				self add: (FRTGlyphGridItemWidget new
					when: #clicked send: #openGlyph: to: self with: glyph glyphName;
					glyph: glyphWidget)]]