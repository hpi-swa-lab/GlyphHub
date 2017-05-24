helper-loading
glifNamed: aGlyphNameString ifLoaded: aBlock ifNotLoaded: anotherBlock

	^ (self glyphLoader loadedGlifsOf: self font atVersion: self font latestVersionHash)
		at: aGlyphNameString
		ifPresent: [:promise | aBlock value: promise value]
		ifAbsent: anotherBlock