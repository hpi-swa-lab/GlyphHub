converting
fromJson: aCollection

	self removeAllParagraphs.
	aCollection do: [:dictionary | self addParagraph: (FRTParagraph new fromJson: dictionary)]