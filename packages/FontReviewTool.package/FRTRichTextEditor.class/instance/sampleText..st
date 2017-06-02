accessing
sampleText: aSampleText

	richText removeAllMorphs.
	self
		fromJson: (Json readFrom: aSampleText text readStream);
		saveButtonVisible: aSampleText author id = self topLevel user id;
		updateToolbar
	