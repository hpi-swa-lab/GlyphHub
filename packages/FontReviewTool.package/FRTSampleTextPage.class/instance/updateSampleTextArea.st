ui
updateSampleTextArea

	| textWidget |
	sampleTextArea removeAllMorphs.
	textWidget := (FRTGlyphWidget new
		pointSize: 24).
	self flag: #TODO. "Right now the size is hardcoded, later it should be changeable via sidebar"
	
	(self topLevel backend loadWhere: #fontName equals: (fontSelectCompletion text) into: FRTFont populate: {}) then: [:fonts | | font |
		font := fonts anyOne.
		textWidget font: font.
		(self topLevel backend convertUnicodeToGlyphNames: (self sampleText text) of: font) then: [:glyphNames |
			textWidget glyphNames: (glyphNames collect: #first).
			sampleTextArea add: textWidget]]