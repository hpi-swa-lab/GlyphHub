helper-loading
glifNamed: aGlyphNameString ifNotLoaded: anotherBlock

	^ self glifNamed: aGlyphNameString ifLoaded: #yourself ifNotLoaded: anotherBlock