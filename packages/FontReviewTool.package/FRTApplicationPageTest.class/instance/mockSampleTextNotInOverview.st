mock-data
mockSampleTextNotInOverview

	^ FRTSampleText new
		text: '[{"alignment":"left","font":null,"openTypeFeatures":null,"pointSize":16,"text":"Mad wizards brew evil jack with horses"}]';
		title: 'Sample Text that should not appear';
		author: self mockUser;
		shouldBeInOverview: false;
		yourself	