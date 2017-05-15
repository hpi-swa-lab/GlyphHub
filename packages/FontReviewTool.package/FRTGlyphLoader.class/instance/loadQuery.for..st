as yet unclassified
loadQuery: query for: aCachedGlyph

	^ (aCachedGlyph font backend loadUfoDetails: query font: aCachedGlyph font)
		then: [:details |
			details at: 'fontinfo' ifPresent: [:info | self cacheFontinfo: info for: aCachedGlyph].
			
			(details at: 'glifs') keysAndValuesDo: [:glyphName :glif | 
				(self lookupCached: (aCachedGlyph withGlyphName: glyphName))
					glif: (self parseGlif: glif);
					finishLoading].
			self]