accessing
createGlyphPreviewWidgetsFor: aCollectionOfFRTGlyphs

	aCollectionOfFRTGlyphs do: [:glyph |
		glyph glyphName ~= '.notdef' ifTrue: [
			self add: ((FRTGlyphPreviewWidget newWithRenderer: renderer)
				when: #clicked send: #openGlyph: to: self with: glyph glyphName;
				glyph: glyph;
				pointSize: self pointSize)]]