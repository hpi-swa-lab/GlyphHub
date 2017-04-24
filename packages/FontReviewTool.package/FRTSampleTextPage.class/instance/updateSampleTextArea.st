ui
updateSampleTextArea

	sampleTextArea removeAllMorphs.
	sampleTextWidget := (FRTGlyphWidget new
		pointSize: self topLevel sidebar standardPointSize).
	
	(self topLevel backend loadWhere: #fontName equals: (fontSelectCompletion text) into: FRTFont populate: {'family'}) then: [:fonts | | font |
		font := fonts anyOne.
		sampleTextWidget font: font.
		self topLevel sidebar selectedFont: font.
		(self topLevel backend convertUnicodeToGlyphNames: (self sampleText text) of: font) then: [:glyphNames |
			sampleTextWidget glyphNames: (glyphNames collect: #first).
			sampleTextArea add: sampleTextWidget]]