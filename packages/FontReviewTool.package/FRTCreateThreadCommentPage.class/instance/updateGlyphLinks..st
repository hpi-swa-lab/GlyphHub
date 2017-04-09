updating
updateGlyphLinks: aThread
	
	aThread isCreated ifTrue: [^ self].
	
	glyphLinkContainer removeAllMorphs.
	aThread threadGlyphAssociations size = 1
		ifTrue: [glyphLinkContainer add: (BTLabel text: thread threadGlyphAssociations anyOne glyph glyphName)]
		ifFalse: [glyphLinkContainer addAll:
			(thread threadGlyphAssociations collect: [:threadGlyph |
				(BTCheckboxWithLabel label: 'Link comment with ', threadGlyph glyph glyphName) checked: true])]