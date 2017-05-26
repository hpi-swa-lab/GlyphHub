as yet unclassified
canDrawImmediately: aGlyphNameCollection font: aFont atVersion: aVersionHashString

	^ self
		loaderFor: aFont
		atVersion: aVersionHashString
		ifPresent: [:loader | loader canDrawImmediately: aGlyphNameCollection]
		ifAbsent: [false]