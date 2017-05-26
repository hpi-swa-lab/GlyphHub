as yet unclassified
loadQuery: query

	^ (self font loadUfoDetails: query version: self versionHash)
		then: [:details |
			details at: 'fontinfo' ifPresent: [:info | fontinfo := info].
			
			(details at: 'glifs') keysAndValuesDo: [:glyphName :glifData | | glif |
				glif := self parseGlif: glifData.
				(glifs at: glyphName ifAbsentPut: [BTPromise new]) in: [:promise |
					promise isPending ifTrue: [promise resolveWith: glif]]]]