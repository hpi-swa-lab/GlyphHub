as yet unclassified
setUp
 
	sampleText := self mockSampleText.
	self
		setUpForPage: FRTSampleTextOverviewPage new
		with: nil
		prepare: [:topLevel | topLevel addEntity: sampleText]