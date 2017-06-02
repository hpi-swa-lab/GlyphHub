callback
newFamilyWithSampleText: aSampleText

	^ FRTFamily new
		author: self topLevel user;
		familyName: familyName text;
		previewGlyphs: '';
		standardSampleText: aSampleText;
		yourself