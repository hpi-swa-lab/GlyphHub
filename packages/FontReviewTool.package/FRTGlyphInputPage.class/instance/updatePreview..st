as yet unclassified
updatePreview: aString

	(self topLevel backend convertUnicodeToGlyphNames: aString of: self font)
		then: [:glyphNames |
			preview
				pointSize: 64;
				font: self font;
				glyphNames: (glyphNames collect: [:glyphIndex | glyphIndex first])]