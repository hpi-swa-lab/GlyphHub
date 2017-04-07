accessing
openGlyph: aGlyphName

	(((FRTGlyph loadBy: #glyphName value: aGlyphName from: self topLevel backend)
		then:  [:glyphs |
			glyphs
				ifEmpty: [
					FRTGlyph new
						glyphName: aGlyphName;
						saveTo: self topLevel backend]
				ifNotEmpty: [glyphs first]])
		then: [:glyph | | page |
			page := FRTSingleGlyphPage new.
			self topLevel openPage: page.
			page glyph: glyph])
		whenRejected: #signal