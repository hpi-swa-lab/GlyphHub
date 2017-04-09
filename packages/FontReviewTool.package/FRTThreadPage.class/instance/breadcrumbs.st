accessing
breadcrumbs

	^ self enteredFromGlyph
		ifNil: [ | font |
			font := self thread threadGlyphAssociations anyOne glyph font.
			{{''. #home. {FRTProjectOverviewPage. nil}}.
			{font fontName. #font. {FRTFontOverviewPage. font family}}.
			{self thread title. #comments. {nil. nil}}}]
		ifNotNil: [
			{{''. #home. {FRTProjectOverviewPage. nil}}.
			{self enteredFromGlyph font fontName. #font. {FRTFontOverviewPage. self enteredFromGlyph font family}}.
			{'Glyph ', self enteredFromGlyph glyphName. #info_circle. {FRTSingleGlyphPage. self enteredFromGlyph}}.
			{ self thread title. #comments. {nil. nil}}}]