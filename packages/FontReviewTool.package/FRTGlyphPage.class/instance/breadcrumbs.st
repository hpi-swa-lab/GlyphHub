navigation
breadcrumbs

	| fontPage |
	fontPage := FRTFontPage new font: self glyph font.

	^ fontPage breadcrumbs
		add: (BTBreadcrumb
			icon: #info_circle
			text: 'Glyph ', self glyph glyphName
			bookmark: (BTPageBookmark pageClass: self class input: self glyph));
		yourself