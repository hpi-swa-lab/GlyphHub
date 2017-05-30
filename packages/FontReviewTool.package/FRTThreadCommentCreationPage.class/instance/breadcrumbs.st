accessing
breadcrumbs

	| title breadcrumbs fontPage |
	title := self thread isCreated ifTrue: ['New Comment'] ifFalse: ['New Thread'].
	
	fontPage := FRTFontPage new font: self thread font.
	breadcrumbs := fontPage breadcrumbs.
	
	self enteredFromGlyph
		ifNotNil: [
			breadcrumbs
				add: (BTBreadcrumb
					icon: #info_circle
					text: 'Glyph ', self enteredFromGlyph glyphName
					bookmark: (BTPageBookmark pageClass: FRTGlyphPage input: self enteredFromGlyph))].
	
	self thread isCreated ifTrue: [
		breadcrumbs add: (BTBreadcrumb
			icon: #comments
			text: self thread title
			bookmark: (BTPageBookmark page: FRTThreadPage input: {self thread. self enteredFromGlyph}))].
	
	breadcrumbs
		add: (BTBreadcrumb
			icon: #pencil
			text: title
			bookmark: (BTPageBookmark page: self class input: {self thread. self enteredFromGlyph})).
		
	^ breadcrumbs