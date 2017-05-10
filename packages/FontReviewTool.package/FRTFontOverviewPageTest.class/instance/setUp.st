as yet unclassified
setUp

	family := self mockFamily.
	
	super setUpForPage: FRTFontOverviewPage new with: family prepare: [:topLevel | topLevel addEntity: family]