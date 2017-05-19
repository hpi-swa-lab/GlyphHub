mock-data
mockFont

	^ FRTFont new
		fontName: 'Riblon';
		family: (FRTFamily new
			previewGlyphs: '';
			versionMessages: {Dictionary new
				at: 'message' put: 'First Version';
				at: 'version_hash' put: '1234567890123456789012345678901234567890';
				at: 'datetime' put: '2017-05-16T16:39:39.000000';
				yourself};
			familyName: 'Riblooon');
		author: self mockUser