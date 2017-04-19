accessing
breadcrumbs

	| title crumbs |
	title := self thread isCreated ifTrue: ['New Comment'] ifFalse: ['New Thread'].
	crumbs := OrderedCollection with: {''. #home. {FRTFamilyOverviewPage. nil}}.
	
	self enteredFromGlyph
		ifNil: [ | family |
			family := self thread threadGlyphAssociations anyOne glyph font family.
			crumbs add: {family familyName. #font. {FRTFontOverviewPage. family}}]
		ifNotNil: [
			crumbs
				add: {self enteredFromGlyph font fontName. #font. {FRTFontOverviewPage. self enteredFromGlyph font family}};
				add: {'Glyph ', self enteredFromGlyph glyphName. #info_circle. {FRTGlyphPage. self enteredFromGlyph}}].
	
	self thread isCreated ifTrue: [
		crumbs add: {self thread title. #comments. {FRTThreadPage. {self thread. self enteredFromGlyph}}}].
	
	^ crumbs
		add: {title. #pencil. {nil. nil}};
		yourself