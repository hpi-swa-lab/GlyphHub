callbacks
enteringWith: aThreadAndGlyph

	| promise |
	promise := aThreadAndGlyph first isCreated
		ifFalse: [BTPromise unit: aThreadAndGlyph first]
		ifTrue: [
			(FRTThread load: aThreadAndGlyph first id populate: #(comments  'comments.author' threadGlyphAssociations 'threadGlyphAssociations.glyph' 'threadGlyphAssociations.glyph.font' 'threadGlyphAssociations.glyph.font.family') from: self topLevel backend)].

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