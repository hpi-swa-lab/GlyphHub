helper
setUpWithoutPagePrepare: aBlock

	super setUp.
	
	topLevel := FRTMockTopLevel firstPage: FRTApplicationPage new with: nil prepare: aBlock