as yet unclassified
updateGlyphWidget

	glyphWidgetArea removeAllMorphs.

	(self backend convertUnicodeToGlyphNames: textEntry text features: '' of: font)
		then: [:glyphNames |
			glyphNames do: [:glyphNameTuple | | glyphWidget |
				glyphWidget := FRTGlyphWidget new
							pointSize: 64;
							font: font;
							glyphNames: {glyphNameTuple first}.
				glyphWidgetArea add: (
					BTClickable new
						add: glyphWidget;
						when: #clicked
						send: #openCurveEditing:
						to: self
						with: glyphWidget)]]