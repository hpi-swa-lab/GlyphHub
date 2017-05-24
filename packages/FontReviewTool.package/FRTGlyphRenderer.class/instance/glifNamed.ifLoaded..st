helper-loading
glifNamed: aGlyphNameString ifLoaded: aBlock

	^ self glifNamed: aGlyphNameString ifLoaded: aBlock ifNotLoaded: [self error: 'Glyph not loaded yet.']