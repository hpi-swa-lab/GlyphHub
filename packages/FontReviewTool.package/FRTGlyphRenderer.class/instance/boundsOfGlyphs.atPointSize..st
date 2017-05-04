geometry
boundsOfGlyphs: aGlyphNameStringCollection atPointSize: aNumber

	^ self
		boundsOfGlifs: (aGlyphNameStringCollection
			collect: [:name | glifs at: name ifAbsent: [nil]]
			thenSelect: #notNil)
		atPointSize: aNumber