accessing
associations

	^ {
		#comments -> {FRTComment. #author. #many}.
		#fonts -> {FRTFont. #author. #many}.
		#attachments -> {FRTAttachment. #owner. #many}
	} as: Dictionary