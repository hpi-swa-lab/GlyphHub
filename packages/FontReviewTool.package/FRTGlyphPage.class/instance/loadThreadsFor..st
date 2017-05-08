loading
loadThreadsFor: aGlyph

	((aGlyph threadGlyphAssociations collect: [:association | association thread]) sortedBy: #id) do: [:each |
		commentThreadArea add: (FRTThreadPreviewWidget new
			thread: each;
			enteredFromGlyph: self glyph)]