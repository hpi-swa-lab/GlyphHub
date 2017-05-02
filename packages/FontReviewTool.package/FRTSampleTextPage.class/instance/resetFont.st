ui
resetFont

	self sampleTextWidget font: self topLevel standardFont.
	self topLevel resetSelectedFamily.
	self activeHand newKeyboardFocus: nil.
	fontSelectCompletion resetText.
	self changed