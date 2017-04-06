accessing
associations

	^ {
		#font -> {FRTFont. #glyphs. #single}.
		#threads -> {FRTThread. #glyphs. #many}
	} as: Dictionary