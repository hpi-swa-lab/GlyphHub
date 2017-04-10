callbacks
enteringWith: aThreadAndGlyph

	| promise |
	promise := aThreadAndGlyph first isCreated
		ifFalse: [BTPromise unit: aThreadAndGlyph first]
		ifTrue: [
			(FRTThread load: aThreadAndGlyph first id populate: #(comments  'comments.author' threadGlyphAssociations 'threadGlyphAssociations.glyph' 'threadGlyphAssociations.glyph.font' 'threadGlyphAssociations.glyph.font.family') from: self topLevel backend)].

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
				enteredFromGlyph: aThreadAndGlyph second;
				updateTitle: newThread;
				updateGlyphLinks: newThread.
			
			preview
				font: newThread threadGlyphAssociations anyOne glyph font;
				glyphNames: (newThread threadGlyphAssociations collect: [:association | association glyph glyphName])]