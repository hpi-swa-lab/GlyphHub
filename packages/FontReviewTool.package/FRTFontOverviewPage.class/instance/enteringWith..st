accessing
enteringWith: aFamily

	^ (FRTFamily load: aFamily id populate: #('fonts' 'fonts.author') from: self topLevel backend)
		then: [:newFamily |
			self family: newFamily.
			self font: newFamily fonts anyOne.
			
			self renderer font: self font.
			
			fontNameLabel heading: self font fontName.
			fontAuthorLabel text: 'by ', self font author username.
	
			BTPromise all: {
				(self renderer loadDataForAllGlyphs)
					then: [:renderer |
						self gridWidget glyphNames: renderer loadedGlifs keys.
						self layoutChanged].
				self loadThreads}]