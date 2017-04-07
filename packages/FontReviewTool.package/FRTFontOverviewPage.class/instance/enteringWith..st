accessing
enteringWith: aFamily

	self family: aFamily.
	self font: aFamily fonts anyOne.
	
	self renderer font: self font.
	
	fontNameLabel heading: self font fontName.
	fontAuthorLabel text: 'by: ', self font author username.
	
	^ BTPromise all: {
		(self renderer loadDataForAllGlyphs)
			then: [:renderer |
				self gridWidget glyphNames: renderer loadedGlifs keys].
		self loadThreads}