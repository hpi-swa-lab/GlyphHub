accessing
breadcrumbs

	^ self enteredFromGlyph
		ifNil: [ | font |
			font := self thread threadGlyphAssociations anyOne glyph font.
			{{''. #home. {FRTFamilyOverviewPage. nil}}.
			{font fontName. #font. {FRTFontOverviewPage. font family}}.
			{self thread title. #comments. {nil. nil}}}]
		ifNotNil: [
			{{''. #home. {FRTFamilyOverviewPage. nil}}.
			{self enteredFromGlyph font fontName. #font. {FRTFontOverviewPage. self enteredFromGlyph font family}}.
			{'Glyph ', self enteredFromGlyph glyphName. #info_circle. {FRTGlyphPage. self enteredFromGlyph}}.
			{ self thread title. #comments. {nil. nil}}}]