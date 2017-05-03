ui
applyFontToSampleTextWidget

	sampleTextWidget text: self sampleText text.
	commentSelectionButton visible: true.
	(self selectedFont downloadOTF)
		then: [sampleTextWidget font: self selectedFont fontNameForPango]