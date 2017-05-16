mock-data
mockFont

	^ FRTFont new
		fontName: 'Riblon';
		family: (FRTFamily new
			previewGlyphs: '';
			familyName: 'Riblooon');
		versionMessages: {Dictionary new
			at: 'message' put: 'First Version';
			at: 'version_hash' put: 'My Message!';
			at: 'datetime' put: '2017-05-16T16:39:39.000000';
			yourself};
		author: self mockUser