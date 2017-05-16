paragraphs
addEmptyParagraphWithPlaceholder: aString pointSize: aPtSizeNumber

	| newParagraph |
	newParagraph := (FRTParagraph new 
		default;
		placeholder: aString;
		pointSize: aPtSizeNumber).
	self hasSubmorphs ifTrue: [
		newParagraph font: self lastSubmorph font].
	self addParagraph: newParagraph