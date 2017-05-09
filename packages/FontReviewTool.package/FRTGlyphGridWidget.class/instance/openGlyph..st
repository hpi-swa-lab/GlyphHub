accessing
openGlyph: aGlyphName

	| glyphLoadDictionary |
	glyphLoadDictionary := {
		#glyphName -> aGlyphName.
		#fontId -> self font id} as: Dictionary.
	(((FRTGlyph loadWhere: glyphLoadDictionary from: self topLevel backend)
		then:  [:glyphs |
			glyphs
				ifEmpty: [
					FRTGlyph new
						glyphName: aGlyphName;
						font: self font;
						saveTo: self topLevel backend]
				ifNotEmpty: [glyphs first]])
		then: [:glyph | self topLevel openPage: FRTGlyphPage new with: glyph])