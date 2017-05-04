geometry
transformPoint: aPoint pointSize: aNumber

	^ self fontinfo
		ifNotNilDo: [:fontinfo | (aPoint x @ ((fontinfo at: 'ascender') - aPoint y)) / (fontinfo at: 'unitsPerEm') * aNumber]
		ifNil: [aPoint]