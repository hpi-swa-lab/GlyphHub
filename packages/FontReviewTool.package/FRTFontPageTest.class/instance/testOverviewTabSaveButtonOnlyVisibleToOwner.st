testing
testOverviewTabSaveButtonOnlyVisibleToOwner

	self setUpForDefaultFamily.
	
	(self expect: page overviewTab sampleTextEditor saveButtonVisible) to be: false.
	self topLevel user: family defaultFont author.
	
	self enterPage.
	(self expect: page overviewTab sampleTextEditor saveButtonVisible) to be: true.