initialize-release
initializeSampleTextArea

	sampleTextEditor := FRTFontOverviewEditor new.
	sampleTextEditor when: #saved send: #trySaveSampleText: to: self.

	^ BTPage column add: sampleTextEditor