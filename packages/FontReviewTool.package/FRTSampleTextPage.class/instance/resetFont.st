ui
resetFont

	sampleTextArea
		removeAllMorphs;
		add: (BTLabel text: sampleText text).
	self topLevel resetSelectedFamily.
	self changed