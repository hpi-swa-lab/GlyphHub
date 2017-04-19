suggestions
openSuggestionPopup

	self world ifNotNil: [
		suggestions
			openInWorld;
			extent: self extent;
			topLeft: (suggestions openPositionFor: self) ]