navigation
breadcrumbs

	^ self enteredFromGlyph
		ifNil: [ | font |
			font := self thread threadGlyphAssociations anyOne glyph font.
			{{''. #home. {FRTFamilyOverviewPage. nil}}.
			{font fontName. #font. {FRTFontPage. font}}.
			{self thread title. #comments. {nil. nil}}}]
		ifNotNil: [
			{{''. #home. {FRTFamilyOverviewPage. nil}}.
			{self enteredFromGlyph font fontName. #font. {FRTFontPage. self enteredFromGlyph font}}.
			{'Glyph ', self enteredFromGlyph glyphName. #info_circle. {FRTGlyphPage. self enteredFromGlyph}}.
			{ self thread title. #comments. {nil. nil}}}]