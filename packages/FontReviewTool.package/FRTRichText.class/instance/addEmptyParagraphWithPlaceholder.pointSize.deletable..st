paragraphs
addEmptyParagraphWithPlaceholder: aString pointSize: aPtSizeNumber deletable: aBoolean

	| newParagraph |
	newParagraph := (FRTParagraph new 
		default;
		placeholder: aString;
		pointSize: aPtSizeNumber;
		deletable: aBoolean).
	self hasSubmorphs ifTrue: [
		newParagraph font: self lastSubmorph font].
	self addParagraph: newParagraph