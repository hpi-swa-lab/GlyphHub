callbacks
updatePreview: aString

	(self topLevel backend convertUnicodeToGlyphNames: aString of: self font)
		then: [:glyphNames |
			preview
				pointSize: self previewPointSize;
				font: self font;
				glyphNames: (glyphNames collect: [:glyphIndex | glyphIndex first])]