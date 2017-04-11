callbacks
createNewThread

	| thread |
	thread := FRTThread new.
	
	((((self topLevel backend convertUnicodeToGlyphNames: inputArea text of: self font)
		then: [:glyphNames | FRTGlyph ensureExists: (glyphNames collect: #first) font: self font in: self topLevel backend])
		then: [:glyphs |
			glyphs do: [:glyph |
				FRTThreadGlyphAssociation new thread: thread; glyph: glyph].
			self topLevel openPage: FRTCreateThreadCommentPage new with: {thread. nil}])
		catch: [self topLevel displayNotification: 'Creating Thread failed.' type: #danger])