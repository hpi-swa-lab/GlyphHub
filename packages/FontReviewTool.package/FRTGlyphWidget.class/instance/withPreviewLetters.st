initialize-release
withPreviewLetters
	" put in the two preview letters for the assigned font "
	
	renderer previewGlyphs
		then: [:glyphs | self glyphNames: glyphs]