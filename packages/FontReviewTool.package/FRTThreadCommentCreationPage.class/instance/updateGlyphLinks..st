updating
updateGlyphLinks: aThread
	
	aThread isCreated ifTrue: [^ self].
	
	glyphLinkContainer removeAllMorphs.
	aThread threadGlyphAssociations size = 1
		ifTrue: [glyphLinkContainer visible: false]
		ifFalse: [
			glyphLinkContainer
				visible: true;  
				addAll: (thread threadGlyphAssociations collect: [:threadGlyph |
					(BTCheckboxWithLabel label: 'Link comment with ', threadGlyph glyph glyphName) checked: true])]