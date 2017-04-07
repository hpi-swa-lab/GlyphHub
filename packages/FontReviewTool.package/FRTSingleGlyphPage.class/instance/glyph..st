accessing
glyph: aGlyph

	(FRTGlyph load: aGlyph id populate: #(threads 'threads.comments' 'threads.comments.author' font) from: self topLevel backend)
		then: [:newGlyph |
			self updateUnicodeLabel: newGlyph.
			glyph := newGlyph.
			glyphName heading: 'Glyph ', newGlyph glyphName.
			glyphWidget
				glyph: glyph;
				pointSize: 128.
			(newGlyph threads sortedBy: #id) do: [:each |
				commentThreadArea add: (FRTThreadPreviewWidget new thread: each)]]