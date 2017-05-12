running
setUpForDefaultFamilyWithThread

	| thread |
	thread := self mockThread.
	self setUpForPage: FRTFontPage new with: thread font prepare: [:topLevel | topLevel addEntity: thread].
	^ thread