navigation
breadcrumbs

	| breadcrumbs fontPage |
	fontPage := FRTFontPage new font: (self thread font).
	breadcrumbs := fontPage breadcrumbs.
	
	 self enteredFromGlyph ifNotNil: [
		breadcrumbs add: (BTBreadcrumb
			icon: #info_circle
			text: 'Glyph ', self enteredFromGlyph glyphName
			bookmark: (BTPageBookmark page: FRTGlyphPage input: self enteredFromGlyph))].
		
	breadcrumbs add: (BTBreadcrumb
		icon: #comments
		text: self thread title
		bookmark: (BTPageBookmark page: FRTThreadPage input: {self thread . nil})).
	
	^ breadcrumbs