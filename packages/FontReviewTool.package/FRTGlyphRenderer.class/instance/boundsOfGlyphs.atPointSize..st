geometry
boundsOfGlyphs: aGlyphNameStringCollection atPointSize: aNumber

	^ self
		boundsOfGlifs: (aGlyphNameStringCollection
			collect: [:name | self glifNamed: name ifNotLoaded: [nil]]
			thenSelect: #notNil)
		atPointSize: aNumber