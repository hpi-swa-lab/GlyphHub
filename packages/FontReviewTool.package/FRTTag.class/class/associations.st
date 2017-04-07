accessing
associations

	^ {
		#sampleTexts -> {FRTSampleText. #tags. #many}.
		#threads ->{FRTThread. #tags. #many}.
		#fonts -> {FRTFont. #tags. #many}
	} as: Dictionary