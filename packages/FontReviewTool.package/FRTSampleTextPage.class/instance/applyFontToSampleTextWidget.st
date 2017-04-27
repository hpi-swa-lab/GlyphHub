ui
applyFontToSampleTextWidget

	sampleTextWidget text: self sampleText text.
	(self selectedFont downloadOTF)
		then: [sampleTextWidget font: self selectedFont fontNameForPango]