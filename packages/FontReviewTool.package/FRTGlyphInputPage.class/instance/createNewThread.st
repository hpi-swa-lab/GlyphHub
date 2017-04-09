as yet unclassified
createNewThread

	| thread |
	thread := FRTThread new.
	
	(((((self topLevel backend convertUnicodeToGlyphNames: inputArea text of: self font)
		then: [:glyphNames | FRTGlyph ensureExists: (glyphNames collect: #first) font: self font in: self topLevel backend])
		then: [:glyphs | glyphs collect: [:glyph | FRTThreadGlyphAssociation new thread: thread; glyph: glyph] as: BTModelList])
		then: [self topLevel openPage: FRTCreateThreadCommentPage new with: {thread. nil}])
		catch: #signal)