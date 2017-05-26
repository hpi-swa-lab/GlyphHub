as yet unclassified
loaderFor: aFont atVersion: aVersionHashString

	^ loaders
		at: (FRTCachedFontinfoKey font: aFont version: aVersionHashString)
		ifAbsentPut: [
			FRTGlyphLoaderPerFont new
				font: aFont;
				versionHash: aVersionHashString;
				yourself]