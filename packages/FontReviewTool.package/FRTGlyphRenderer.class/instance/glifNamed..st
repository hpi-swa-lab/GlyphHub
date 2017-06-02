helper-loading
glifNamed: aGlyphNameString

	^ self glifNamed: aGlyphNameString ifLoaded: #yourself ifNotLoaded: [self error: 'Glyph not loaded yet.']