mock-data
mockFamily

	author := FRTUser new username: 'Eva'.

	family := FRTFamily new
		familyName: 'Riblooon';
		previewGlyphs: '';
		standardSampleText: (FRTSampleText new
				text: FRTRichText standardEmptyFamilyText asJsonString;
				title: 'blah';
				author: author);
		versionMessages: #();
		yourself.
		
	family fonts add: (FRTFont new
		fontName: 'HI';
		author: author).
	
	^ family