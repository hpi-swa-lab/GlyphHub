actions
importGlyphs: aGlyphNameStringCollection font: aFont

	^ (FRTGlyphWidget new
		font: aFont;
		pointSize: 512;
		glyphNames: aGlyphNameStringCollection) whenReady then: [:glyphs | self importObject: glyphs]