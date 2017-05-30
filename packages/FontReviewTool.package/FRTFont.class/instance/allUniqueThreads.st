accessing
allUniqueThreads
	" make sure glyphs.glyphThreadAssociations.thread is populated "

	| threads |
	threads := OrderedCollection new.
	self glyphs do: [:glyph |
		glyph threadGlyphAssociations do: [:threadGlyph |
			threads
				detect: [:other | other id = threadGlyph thread id]
				ifNone: [threads add: threadGlyph thread]]].
	
	^ threads