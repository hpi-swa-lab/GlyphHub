initialize-release
loadThreads
	
	threadsContainer removeAllMorphs.
	^ (FRTFont
		load: self font id
		populate: #(glyphs 'glyphs.threadGlyphAssociations' 'glyphs.threadGlyphAssociations.thread' 'glyphs.threadGlyphAssociations.thread.comments' 'glyphs.threadGlyphAssociations.thread.comments.author')
		from: self backend)
		then: [:newFont | | threads |
			threads := OrderedCollection new.
			newFont glyphs do: [:glyph |
				glyph threadGlyphAssociations do: [:threadGlyph |
					threads detect: [:other | other id = threadGlyph thread id] ifNone: [
						threadGlyph thread closed ifFalse: [threads add: threadGlyph thread]]]].
			threads notEmpty
				ifTrue: [
					threads do: [:thread |
						threadsContainer add: (FRTThreadPreviewWidget new thread: thread)]]
				ifFalse: [threadsContainer
						add: ((BTIcon newFor: #comments) pointSize: 32; alignment: #center);
						add: ((BTLabel secondarySubHeading: 'Discussions about this font will appear here.') alignment: #center)
					"add: (BTLabel secondarySubHeading: 'No open discussions at the moment!')"]]