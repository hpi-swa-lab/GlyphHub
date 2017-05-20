accessing
font

	^ FRTFont load: (self richText selectedParagraph fontId) populate: #() from: self topLevel backend