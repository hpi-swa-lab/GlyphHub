running
setUpForDefaultFamily

	family := self mockFamily.
	self setUpForPage: FRTFontOverviewPage new with: family defaultFont prepare: [:topLevel | topLevel addEntity: family]