initialize-release
loadThreads

	^ (FRTFont
		load: self font id
		populate: #(glyphs 'glyphs.threads' 'glyphs.threads.comments' 'glyphs.threads.comments.author')
		from: self topLevel backend)
		then: [:newFont | | threads |
			threads := OrderedCollection new.
			newFont glyphs do: [:glyph |
				glyph threads do: [:thread |
					threads detect: [:other | other id = thread id] ifNone: [threads add: thread]]].
			threads do: [:thread |
				threadsContainer add: (FRTThreadPreviewWidget new thread: thread)]]