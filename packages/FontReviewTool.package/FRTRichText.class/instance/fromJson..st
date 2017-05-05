as yet unclassified
fromJson: aCollection

	aCollection do: [:dictionary | self addParagraph: (FRTParagraph new fromJson: dictionary)]