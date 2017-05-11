testing
testClosedThreadsNotDisplayed

	| thread |
	thread := self setUpForDefaultFamilyWithThread.
	
	(self expect: page) to haveText: thread title.
	
	self topLevel openPage: FRTFontOverviewPage new with: thread font.
	(self expect: page) to haveText: thread title