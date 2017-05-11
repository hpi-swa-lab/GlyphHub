running
setUpForDefaultFamilyWithThread

	| thread |
	thread := self mockThread.
	self setUpForPage: FRTFontOverviewPage new with: thread font prepare: [:topLevel | topLevel addEntity: thread].
	^ thread