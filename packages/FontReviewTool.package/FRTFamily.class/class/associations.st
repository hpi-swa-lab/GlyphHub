accessing
associations

	^ {
		#fonts -> {FRTFont. #family. #many}.
		#tags -> {FRTTag. #families. #many}
	} as: Dictionary