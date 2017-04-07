accessing
associations

	^ {
		#author -> {FRTUser. #sampleTexts. #single}.
		#tags -> {FRTTag. #sampleTexts. #many}
	} as: Dictionary