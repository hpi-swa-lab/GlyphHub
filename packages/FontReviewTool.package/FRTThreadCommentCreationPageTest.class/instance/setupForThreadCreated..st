running
setupForThreadCreated: aBoolean

	thread := aBoolean ifTrue: [self mockThread] ifFalse: [FRTThread new closed: false].
	
	super
		setUpForPage: FRTThreadCommentCreationPage new
		with: {thread. nil}
		prepare: [:topLevel |
			aBoolean
				ifTrue: [topLevel addEntity: thread]
				ifFalse: [ | glyph |
					topLevel addEntity: (glyph := self mockGlyph).
					
					thread threadGlyphAssociations add: (FRTThreadGlyphAssociation new
						glyph: glyph;
						thread: thread)]]