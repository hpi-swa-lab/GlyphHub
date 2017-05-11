mock-data
mockGlyph

	| font |
	font := FRTFont new
		fontName: 'Riblon';
		family: (FRTFamily new
			previewGlyphs: '';
			familyName: 'Riblooon');
		author: self mockUser.
	
	^ FRTGlyph new
		font: font;
		glyphName: 'A';
		versionHash: 'abc736afeaa2321123afceda'