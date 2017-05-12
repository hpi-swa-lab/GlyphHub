running
setUpForDefaultFamily

	family := self mockFamily.
	self setUpForPage: FRTFontPage new with: family defaultFont prepare: [:topLevel | topLevel addEntity: family]