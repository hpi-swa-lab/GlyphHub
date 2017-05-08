ui
resetFont

	self sampleTextWidget font: self topLevel standardFont.
	self activeHand newKeyboardFocus: nil.
	fontSelectCompletion resetText.
	commentSelectionButton visible: false.
	self changed