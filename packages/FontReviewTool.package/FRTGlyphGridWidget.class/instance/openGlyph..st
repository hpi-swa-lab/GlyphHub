accessing
openGlyph: aGlyphName

	(((FRTGlyph loadWhere: {#glyphName -> aGlyphName. #fontId -> self font id} populate: #() from: self topLevel backend)
		then:  [:glyphs |
			glyphs
				ifEmpty: [
					FRTGlyph new
						glyphName: aGlyphName;
						font: self font;
						saveTo: self topLevel backend]
				ifNotEmpty: [glyphs first]])
		then: [:glyph | self topLevel openPage: FRTGlyphPage new with: glyph])