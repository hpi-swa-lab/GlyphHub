running
setUpForDefaultFamilyWithThread

	| thread |
	thread := self mockThread.
	font := thread font.
	self setUpForPage: FRTFontPage new with: font prepare: [:topLevel | topLevel addEntity: thread].
	^ thread