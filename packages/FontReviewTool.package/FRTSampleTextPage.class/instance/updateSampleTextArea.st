ui
updateSampleTextArea

	sampleTextArea removeAllMorphs.
	sampleTextWidget := (FRTGlyphWidget new
		pointSize: self topLevel sidebar standardPointSize).
	
	(self topLevel backend loadWhere: #fontName equals: (fontSelectCompletion text) into: FRTFont populate: {'family'})
		then: [:fonts | | font |
			font := fonts anyOne.
			self selectedFont: font.
			self topLevel sidebar selectedFont: self selectedFont.
			self updateSampleTextWidget]