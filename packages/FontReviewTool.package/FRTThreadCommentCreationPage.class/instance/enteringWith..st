callbacks
enteringWith: aThreadAndGlyph

	| promise thread glyph |
	thread := aThreadAndGlyph first.
	glyph := aThreadAndGlyph second.
	promise := thread isCreated
		ifFalse: [BTPromise unit: thread]
		ifTrue: [
			(FRTThread load: thread id populate: #(comments  'comments.author' threadGlyphAssociations 'threadGlyphAssociations.glyph' 'threadGlyphAssociations.glyph.font' 'threadGlyphAssociations.glyph.font.family') from: self topLevel backend)].

	(FRTAttachment
		loadWhere: ({'comment_id' -> nil. 'owner_id' -> self topLevel user} as: Dictionary)
		populate: #()
		from: self topLevel backend)
		then: [:attachments |
			imageAttachments addAll: (attachments collect: [:attachment |
				BTImage new
					load: '/attachment/', attachment id, '/resource' from: self topLevel backend; 
					minSize: 128])].

	^ promise
		then: [:newThread |
			self
				thread: newThread;
				enteredFromGlyph: glyph;
				updateTitle: newThread;
				updateGlyphLinks: newThread.

			preview
				font: newThread threadGlyphAssociations anyOne glyph font;
				glyphNames: (newThread threadGlyphAssociations collect: [:association | association glyph glyphName])]