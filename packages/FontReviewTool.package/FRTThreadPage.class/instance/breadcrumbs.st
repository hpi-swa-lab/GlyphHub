accessing
breadcrumbs

	^ self enteredFromGlyph
		ifNil: [
			{{''. #home. {FRTProjectOverviewPage. nil}}.
			{self thread glyphs anyOne font fontName. #font. {FRTFontOverviewPage. self thread glyphs anyOne font family}}.
			 { self thread title. #comments. {nil. nil}}}]
		ifNotNil: [
			{{''. #home. {FRTProjectOverviewPage. nil}}.
			{self enteredFromGlyph font fontName. #font. {FRTFontOverviewPage. self enteredFromGlyph font family}}.
			 {'Glyph ', self enteredFromGlyph glyphName. #info_circle. {FRTSingleGlyphPage. self enteredFromGlyph}}.
			 { self thread title. #comments. {nil. nil}}}]