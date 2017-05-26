loading
loadThreadsFor: aGlyph

	(aGlyph threads sortedBy: #id) do: [:each | | newThreadWidget |
		newThreadWidget := FRTThreadPreviewWidget new.
		commentThreadArea add: newThreadWidget.
		newThreadWidget
			thread: each;
			enteredFromGlyph: self glyph]