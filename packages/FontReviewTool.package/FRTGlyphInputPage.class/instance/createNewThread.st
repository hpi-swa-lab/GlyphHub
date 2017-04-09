as yet unclassified
createNewThread

	| thread |
	thread := FRTThread new.
	(self topLevel backend convertUnicodeToGlyphNames: inputArea text of: self font)
		then: [:glyphNames |
			glyphNames do: [:glyphName |
				thread threadGlyphAssociations add: (FRTThreadGlyphAssociation new
				glyph: glyphName;
				thread: thread;
				yourself)]].
	self topLevel openPage: FRTCreateThreadCommentPage new with: {thread. self glyph}.
	self flag: #TODO "make sure this gets glyphs instead of glyphnames"