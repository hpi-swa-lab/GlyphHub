callbacks
openCreateCommentPage

	| thread |
	thread := FRTThread new.
	
	((((self topLevel backend convertUnicodeToGlyphNames: self sampleTextWidget  selectedText of: self selectedFont)
		then: [:glyphNames | FRTGlyph ensureExists: (glyphNames collect: #first) font: self selectedFont in: self topLevel backend])
		then: [:glyphs |
			glyphs do: [:glyph |
				FRTThreadGlyphAssociation new thread: thread; glyph: glyph].
			self topLevel openPage: FRTThreadCommentCreationPage new with: {thread. nil}])
		catch: [self topLevel displayNotification: 'Creating Thread failed.' type: #danger])