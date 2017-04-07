initialize-release
initializeAllGlyphPage

	gridWidget := FRTGlyphGridWidget newWithRenderer: self renderer.
	^ BTPage column add: gridWidget