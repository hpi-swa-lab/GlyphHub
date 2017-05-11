testing
testClosedThreadsNotDisplayed

	| thread |
	thread := self setUpForDefaultFamilyWithThread.
	
	(self expect: page) to haveText: thread title.
	
	thread closed: true; save.
	(self expect: (self topLevel openPage: FRTFontOverviewPage new with: thread font)) to resolve.
	(self expect: self topLevel openPage) to not haveText: thread title