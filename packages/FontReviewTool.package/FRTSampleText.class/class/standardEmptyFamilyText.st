instance creation
standardEmptyFamilyText

	^ self new
		title: 'Standard Family Sample Text';
		shouldBeInOverview: false;
		text: FRTRichText standardEmptyFamilyText asJsonString