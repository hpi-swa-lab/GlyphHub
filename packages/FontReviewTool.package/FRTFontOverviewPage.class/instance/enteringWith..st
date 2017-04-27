accessing
enteringWith: aFont

	^ (FRTFont load: aFont id populate: #('author' 'family') from: self topLevel backend)
		then: [:newFont |
			self
				font: newFont;
				family: newFont family.
			
			self topLevel sidebar selectedFont: self font.
			self renderer font: self font.
			
			fontNameLabel text: self font fontName.
			fontAuthorLabel text: 'by ', self font author username.
			
			BTPromise all: {
				(self renderer loadDataForAllGlyphs)
					then: [:renderer |
						self gridWidget glyphNames: renderer loadedGlifs keys.
						self layoutChanged].
				self loadThreads}]