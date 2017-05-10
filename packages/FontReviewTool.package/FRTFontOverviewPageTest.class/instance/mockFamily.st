as yet unclassified
mockFamily

	| family |
	family := FRTFamily new
		familyName: 'Riblooon';
		previewGlyphs: '';
		yourself.
	
	family fonts add: (FRTFont new
		fontName: 'HI';
		author: (FRTUser new username: 'Eva')).
	
	^ family