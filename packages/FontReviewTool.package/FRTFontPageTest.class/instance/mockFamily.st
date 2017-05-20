mock-data
mockFamily

	author := FRTUser new username: 'Eva'.

	family := FRTFamily new
		familyName: 'Riblooon';
		previewGlyphs: '';
		versionMessages: #();
		yourself.
		
	family fonts add: (FRTFont new
		fontName: 'HI';
		author: author).
	
	^ family