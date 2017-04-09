accessing
associations

	^ {
		#font -> {FRTFont. #glyphs. #single}.
		#threadGlyphAssociations -> {FRTThreadGlyphAssociation. #glyph. #many}
	} as: Dictionary