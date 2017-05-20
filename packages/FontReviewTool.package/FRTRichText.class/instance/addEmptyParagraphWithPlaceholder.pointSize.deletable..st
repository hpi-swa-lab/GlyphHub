paragraphs
addEmptyParagraphWithPlaceholder: aString pointSize: aPtSizeNumber deletable: aBoolean

	| newParagraph |
	newParagraph := (FRTParagraph new 
		default;
		placeholder: aString;
		pointSize: aPtSizeNumber;
		deletable: aBoolean).
	self hasSubmorphs ifTrue: [
		newParagraph
			fontId: self lastSubmorph fontId;
			fontNameForPango: self lastSubmorph fontNameForPango].
	self addParagraph: newParagraph