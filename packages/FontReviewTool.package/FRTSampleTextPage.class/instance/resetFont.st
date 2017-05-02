ui
resetFont

	self sampleTextWidget font: 'roboto'.
	self topLevel resetSelectedFamily.
	self activeHand newKeyboardFocus: nil.
	fontSelectCompletion resetText.
	self changed