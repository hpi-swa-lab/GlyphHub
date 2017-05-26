converting
fromJson: aCollection

	self removeAllMorphs.
	aCollection do: [:dictionary | self addParagraph: (FRTParagraph new fromJson: dictionary)]