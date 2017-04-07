navigation
breadcrumbs

	^ self glyph
		ifNil: [{}]
		ifNotNil: [
			{{''. #home. []}.
			 {self glyph font fontName. #font. []}.
			 {'Glyph ', self glyph glyphName. #info_circle. []}}]