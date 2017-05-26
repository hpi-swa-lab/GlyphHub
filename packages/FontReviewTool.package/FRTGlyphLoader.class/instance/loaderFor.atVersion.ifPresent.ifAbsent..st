as yet unclassified
loaderFor: aFont atVersion: aVersionHashString ifPresent: aBlock ifAbsent: anotherBlock

	^ loaders
		at: (FRTCachedFontinfoKey font: aFont version: aVersionHashString)
		ifPresent: aBlock
		ifAbsent: anotherBlock