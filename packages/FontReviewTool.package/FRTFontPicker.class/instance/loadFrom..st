loading
loadFrom: aBackend

	(FRTFont loadAllFrom: aBackend populate: #(family)) then: [:fonts | 
		self suggestionsList: ((fonts sortedBy: #fontName)
			collect: [:font | BTTextCompletionSuggestion label: font fontName data: font])]