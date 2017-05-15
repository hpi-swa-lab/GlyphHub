mock-data
mockFont

	^ FRTFont new
		fontName: 'Riblon';
		family: (FRTFamily new
			previewGlyphs: '';
			familyName: 'Riblooon');
		versionMessages: {Dictionary new at: 'message' put: 'First Version'; at: 'version_hash' put: 'My Message!'; yourself};
		author: self mockUser