updating
updateGlyphLinks: aThread
	
	aThread isCreated ifTrue: [^ self].
	
	glyphLinkContainer removeAllMorphs.
	aThread threadGlyphAssociations size = 1
		ifTrue: [glyphLinkContainer visible: false]
		ifFalse: [ | button |
			glyphLinkContainer visible: true.
			checkboxes := ((thread threadGlyphAssociations sortedBy: #stringIndex) collect: [:threadGlyph |
				threadGlyph glyph ifNotNil: [
					threadGlyph glyph glyphName ~= '.notdef' ifTrue: [
						(BTCheckboxWithLabel label: 'Link comment with ', threadGlyph glyph glyphName) checked: true]]] thenSelect: #notNil).
			
			button := ((BTButton label: 'Unlink all')
				small;
				when: #clicked send: #unlinkAll: to: self with: checkboxes).
					
			glyphLinkContainer
				add: button;
				add: (BTScrollArea new
					add: (BTPage column
						addAll: checkboxes))]