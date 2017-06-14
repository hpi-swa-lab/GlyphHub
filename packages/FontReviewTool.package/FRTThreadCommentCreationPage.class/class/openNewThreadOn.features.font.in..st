examples
openNewThreadOn: aString features: aFeaturesString font: aFont in: aTopLevel

	| thread glyphNamesAndIndices |
	thread := FRTThread new.
	
	((((aTopLevel backend convertUnicodeToGlyphNames: aString features: aFeaturesString of: aFont)
		then: [:glyphNames |
			glyphNamesAndIndices := glyphNames.
			FRTGlyph ensureExists: (glyphNamesAndIndices collect: #first) font: aFont in: aTopLevel backend.])
		then: [:glyphs | | glyphsDictionary indexedGlyphs |
			(glyphs allSatisfy: [:glyph | glyph isUndefinedGlyph])
				ifFalse:[
					glyphsDictionary := Dictionary new.
					glyphs do: [:glyphModel | glyphsDictionary at: glyphModel glyphName put: glyphModel].
					indexedGlyphs := glyphNamesAndIndices collect: [:glyphNameAndIndex |
						{glyphsDictionary at: glyphNameAndIndex first. glyphNameAndIndex second}].
					indexedGlyphs do: [:indexedGlyph |
						FRTThreadGlyphAssociation new
							thread: thread;
							glyph: (indexedGlyph first isUndefinedGlyph ifFalse: [indexedGlyph first] ifTrue: nil);
							stringIndex: indexedGlyph second].
					aTopLevel openPage: FRTThreadCommentCreationPage new with: {thread. nil}]
				ifTrue: [aTopLevel displayNotification: 'You need at least one defined glyph to comment on.' type: #danger]])
		catch: [aTopLevel displayNotification: 'Creating Thread failed.' type: #danger])