accessing
openGlyph: aGlyphName

	(((FRTGlyph loadWhere: {#glyphName -> aGlyphName. #font -> self font} populate: #() from: self topLevel backend)
		then:  [:glyphs |
			glyphs
				ifEmpty: [
					FRTGlyph new
						glyphName: aGlyphName;
						font: self font;
						saveTo: self topLevel backend]
				ifNotEmpty: [glyphs onlyElement]])
		then: [:glyph | self topLevel openPage: FRTGlyphPage new with: glyph])