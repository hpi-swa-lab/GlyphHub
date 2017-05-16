ui
applyFontToSampleTextWidget

	commentSelectionButton visible: true.
	(self selectedFont downloadOtf)
		then: [sampleTextWidget font: self selectedFont fontNameForPango]