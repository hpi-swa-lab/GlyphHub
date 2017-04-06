accessing
associations

	^ {
		#author -> {FRTUser. #comments. #single}.
		#thread -> {FRTThread. #comments. #single}
	} as: Dictionary