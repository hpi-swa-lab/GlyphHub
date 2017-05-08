loading
loadThreadsFor: aGlyph

	(aGlyph threads sortedBy: #id) do: [:each |
		commentThreadArea add: (FRTThreadPreviewWidget new
			thread: each;
			enteredFromGlyph: self glyph)]