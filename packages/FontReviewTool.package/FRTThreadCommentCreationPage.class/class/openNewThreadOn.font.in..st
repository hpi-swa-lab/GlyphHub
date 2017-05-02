examples
openNewThreadOn: aString font: aFont in: aTopLevel

	| thread |
	thread := FRTThread new.
	
	((((aTopLevel backend convertUnicodeToGlyphNames: aString of: aFont)
		then: [:glyphNames | FRTGlyph ensureExists: (glyphNames collect: #first) font: aFont in: aTopLevel backend])
		then: [:glyphs |
			glyphs do: [:glyph |
				FRTThreadGlyphAssociation new thread: thread; glyph: glyph].
			aTopLevel openPage: FRTThreadCommentCreationPage new with: {thread. nil}])
		catch: [aTopLevel displayNotification: 'Creating Thread failed.' type: #danger])