accessing
font

	^ FRTFont load: (self richText selectedParagraph fontId) populate: #(family) from: self topLevel backend