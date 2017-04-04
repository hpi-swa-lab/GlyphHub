accessing
thread: aThread

	thread := aThread.
	
	titleContainer removeAllMorphs.  
	title := aThread ifNotNil: [BTLabel subHeading: aThread title] ifNil: [BTTextArea placeholder: 'Enter Thread Title'].
	titleContainer add: title.
	
	glyphLinkContainer removeAllMorphs.
	thread ifNotNil: [
		thread glyphs size = 1
			ifTrue: [glyphLinkContainer add: (BTLabel text: thread glyphs anyOne glyphName)]
			ifFalse: [glyphLinkContainer addAll:
				(thread glyphs collect: [:glyph | (BTCheckboxWithLabel label: 'Link comment with ', glyph glyphName) checked: true])].
		
		preview text: (((thread codepoints sorted: [ :codepoint1 :codepoint2 | codepoint1 index <= codepoint2 index ]) collect: [ :codepoint | Character value: codepoint unicodeValue ]) as: String)]