as yet unclassified
mockSampleTextNotInOverview

	^ FRTSampleText new
		text: '[{"alignment":"left","font":null,"openTypeFeatures":null,"pointSize":16,"text":"This is some other text"}]';
		title: 'Sample Text that should not appear';
		author: self mockUser;
		shouldBeInOverview: false;
		yourself	