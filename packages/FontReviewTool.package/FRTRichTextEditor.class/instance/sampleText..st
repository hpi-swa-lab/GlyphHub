accessing
sampleText: aSampleText

	richText removeAllMorphs.
	self fromJson: (Json readFrom: aSampleText text readStream).
	self saveButtonVisible: aSampleText author id = self topLevel user id.
	self updateToolbar
	