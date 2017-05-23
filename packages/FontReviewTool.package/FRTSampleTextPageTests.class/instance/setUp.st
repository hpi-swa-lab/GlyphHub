as yet unclassified
setUp
 
	sampleText := self mockSampleText.
	self
		setUpForPage: FRTSampleTextPage new
		with: sampleText
		prepare: [:topLevel | topLevel addEntity: sampleText]