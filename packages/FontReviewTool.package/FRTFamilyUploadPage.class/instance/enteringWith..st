callback
enteringWith: unused

	self clearAlerts.
	familyName text: 'Untitled Family'.
	
	^ (FRTFamily new
		familyName: familyName text;
		previewGlyphs: '';
		saveTo: self backend)
		then: [:family | self family: family]