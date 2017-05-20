testing
testClosedThreadsNotDisplayed

	| thread |
	thread := self setUpForDefaultFamilyWithThread.
	
	(self expect: page) to haveText: thread title.
	(self expect: page) to not haveText: 'Discussions about this font will appear here.'.

	thread closed: true; save.
	(self expect: (self topLevel openPage: FRTFontPage new with: thread font)) to resolve.
	(self expect: self topLevel openPage) to not haveText: thread title.
	(self expect: self topLevel openPage) to haveText: 'Discussions about this font will appear here.'