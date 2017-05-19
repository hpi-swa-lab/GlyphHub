accessing
sampleText: aSampleText

	richText removeAllMorphs.
	self fromJson: (Json readFrom: aSampleText text readStream).
	self updateToolbar