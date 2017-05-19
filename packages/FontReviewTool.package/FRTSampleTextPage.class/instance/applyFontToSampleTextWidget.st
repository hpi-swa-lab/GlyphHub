ui
applyFontToSampleTextWidget

	(self selectedFont downloadOtf)
		then: [sampleTextWidget font: self selectedFont]