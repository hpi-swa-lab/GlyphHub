as yet unclassified
loadAllGlyphsFrom: aFont atVersion: aVersionHashString

	^ (self loaderFor: aFont atVersion: aVersionHashString)
		loadAllGlifs