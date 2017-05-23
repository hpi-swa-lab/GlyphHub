callbacks
updatePreview: aString

	(self backend convertUnicodeToGlyphNames: aString features: #() of: self font)
		then: [:glyphNames |
			preview
				pointSize: self previewPointSize;
				font: self font;
				glyphNames: (glyphNames collect: [:glyphIndex | glyphIndex first])]