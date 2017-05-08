ui
applyFontToSampleTextWidget

	commentSelectionButton visible: true.
	(self selectedFont downloadOTF)
		then: [sampleTextWidget font: self selectedFont fontNameForPango]