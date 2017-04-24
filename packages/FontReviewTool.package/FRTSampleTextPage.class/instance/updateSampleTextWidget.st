ui
updateSampleTextWidget

	sampleTextWidget font: self selectedFont.
			(self topLevel backend convertUnicodeToGlyphNames: (self sampleText text) of: self selectedFont)
				then: [:glyphNames |
					sampleTextWidget glyphNames: (glyphNames collect: #first).
					sampleTextArea add: sampleTextWidget]