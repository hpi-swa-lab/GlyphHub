accessing
associations
	^ {
		#comments -> {FRTComment. #author. #many}.
		#fonts -> {FRTFont. #author. #many}
	} as: Dictionary