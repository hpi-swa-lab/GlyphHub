helper-loading
loadQuery: query

	^ (self font backend loadUfoDetails: query font: self font)
		then: [:details |
			fontinfo := details at: 'fontinfo'.
			(details at: 'glifs') keysAndValuesDo: [:glifName :glif |
				glifs at: glifName put: (XMLDOMParser parseDocumentFrom: glif readStream)].
			self]