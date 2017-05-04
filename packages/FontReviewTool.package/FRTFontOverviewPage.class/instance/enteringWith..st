accessing
enteringWith: aFont

	^ (FRTFont load: aFont id populate: #('author' 'family') from: self backend)
		then: [:newFont |
			self
				font: newFont;
				family: newFont family.
			
			self topLevel selectedFont: self font.
			self renderer font: self font.
			
			fontNameLabel text: self font fontName.
			fontAuthorLabel text: 'by ', self font author username.
			
			BTPromise all: {
				(self renderer loadDataForAllGlyphs)
					then: [:renderer |
						self gridWidget glyphNames: (renderer loadedGlifs keys sort: [:a :b | (a compare: b caseSensitive: false) = 1])].
				self loadThreads}]