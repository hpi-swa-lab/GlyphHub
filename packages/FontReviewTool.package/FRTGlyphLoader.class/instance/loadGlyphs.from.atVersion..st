as yet unclassified
loadGlyphs: aGlyphNameStringCollection from: aFont atVersion: aVersionHashString

	^ (self loaderFor: aFont atVersion: aVersionHashString)
		loadGlifsNamed: aGlyphNameStringCollection