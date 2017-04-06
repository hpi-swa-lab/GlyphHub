accessing
associations
	
	^ {
		#thread -> {FRTThread. #codepoints. #single}.
		#font -> {FRTFont. #codepoints. #single}
	} as: Dictionary