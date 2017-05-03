initialize-release
initializeFontSelection

	self flag: #todo. " not very scalable. we should only load those fonts that match the input "
	
	(FRTFont loadAllFrom: self backend populate: #(family)) then: [:fonts | 
		fontSelectCompletion suggestionsList: ((fonts sortedBy: #fontName)
			collect: [:font | BTTextCompletionSuggestion label: font fontName data: font])]