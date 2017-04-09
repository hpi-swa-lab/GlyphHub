accessing
breadcrumbs

	| title crumbs |
	title := self thread isCreated ifTrue: ['New Comment'] ifFalse: ['New Thread'].
	crumbs := OrderedCollection with: {''. #home. {FRTProjectOverviewPage. nil}}.
	
	self enteredFromGlyph
		ifNil: [ | font |
			font := self thread threadGlyphAssociations anyOne glyph font.
			crumbs add: {font fontName. #font. {FRTFontOverviewPage. font family}}]
		ifNotNil: [
			crumbs
				add: {self enteredFromGlyph font fontName. #font. {FRTFontOverviewPage. self enteredFromGlyph font family}};
				add: {'Glyph ', self enteredFromGlyph glyphName. #info_circle. {FRTSingleGlyphPage. self enteredFromGlyph}}].
	
	self thread isCreated ifTrue: [
		crumbs add: {self thread title. #comments. {FRTThreadPage. {self thread. self enteredFromGlyph}}}].
	
	^ crumbs
		add: {title. #pencil. {nil. nil}};
		yourself