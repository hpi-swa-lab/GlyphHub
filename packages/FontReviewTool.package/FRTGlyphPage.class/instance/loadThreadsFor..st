loading
loadThreadsFor: aGlyph

	(aGlyph threads sortedBy: #id) do: [:each | 
		FRTThreadPreviewWidget new
			addTo: commentThreadArea withThread: each;
			enteredFromGlyph: self glyph]