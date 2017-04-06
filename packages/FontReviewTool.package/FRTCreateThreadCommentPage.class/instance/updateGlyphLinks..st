updating
updateGlyphLinks: aThread
	
	aThread isCreated ifTrue: [^ self].
	
	glyphLinkContainer removeAllMorphs.
	aThread glyphs size = 1
		ifTrue: [glyphLinkContainer add: (BTLabel text: thread glyphs anyOne glyphName)]
		ifFalse: [glyphLinkContainer addAll:
			(thread glyphs collect: [:glyph |
				(BTCheckboxWithLabel label: 'Link comment with ', glyph glyphName) checked: true])]