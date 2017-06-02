as yet unclassified
setUp
 
	sampleText := self mockSampleText.
	otherSampleText := self mockSampleTextNotInOverview.
	self
		setUpForPage: FRTSampleTextOverviewPage new
		with: nil
		prepare: [:topLevel | topLevel addEntity: sampleText; addEntity: otherSampleText]