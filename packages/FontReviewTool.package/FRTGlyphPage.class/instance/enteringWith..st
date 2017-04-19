accessing
enteringWith: aGlyph

	^ (FRTGlyph load: aGlyph id populate: #(threadGlyphAssociations 'threadGlyphAssociations.thread' 'threadGlyphAssociations.thread.comments' 'threadGlyphAssociations.thread.comments.author' font 'font.family') from: self topLevel backend)
		then: [:newGlyph |
			self updateUnicodeLabel: newGlyph.
			self glyph: newGlyph.
			glyphName heading: 'Glyph ', newGlyph glyphName.
			glyphWidget
				glyph: glyph;
				pointSize: 128.
			((newGlyph threadGlyphAssociations collect: [:association | association thread]) sortedBy: #id) do: [:each |
				commentThreadArea add: (FRTThreadPreviewWidget new
					thread: each;
					enteredFromGlyph: self glyph)]]