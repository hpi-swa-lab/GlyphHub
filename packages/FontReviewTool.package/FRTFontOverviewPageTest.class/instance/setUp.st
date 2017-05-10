running
setUp

	family := self mockFamily.
	super setUpForPage: FRTFontOverviewPage new with: family defaultFont prepare: [:topLevel | topLevel addEntity: family]