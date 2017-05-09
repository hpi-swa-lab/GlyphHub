accessing
glyphNames: aCollection

	glyphNames := aCollection.
	(self topLevel backend loadWhere: #glyphName equals: aCollection into: FRTGlyph populate: #('threadGlyphAssociations'))
		then: [ :loadedGlyphs |
			loadedGlyphs do: [:glyph |
				self add: ((FRTGlyphPreviewWidget newWithRenderer: renderer)
					when: #clicked send: #openGlyph: to: self with: glyph glyphName;
					glyph: glyph;
					pointSize: self pointSize)]]