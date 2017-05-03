initialize-release
loadThreads
	
	^ (FRTFont
		load: self font id
		populate: #(glyphs 'glyphs.threadGlyphAssociations' 'glyphs.threadGlyphAssociations.thread' 'glyphs.threadGlyphAssociations.thread.comments' 'glyphs.threadGlyphAssociations.thread.comments.author')
		from: self backend)
		then: [:newFont | | threads |
			threads := OrderedCollection new.
			newFont glyphs do: [:glyph |
				glyph threadGlyphAssociations do: [:threadGlyph |
					threads detect: [:other | other id = threadGlyph thread id] ifNone: [threads add: threadGlyph thread]]].
			threads do: [:thread |
				threadsContainer add: (FRTThreadPreviewWidget new thread: thread)]]