helper
setUpForPage: aPage with: anObject prepare: aBlock

	super setUp.
	
	page := aPage.
	topLevel := FRTMockTopLevel firstPage: aPage with: anObject prepare: aBlock