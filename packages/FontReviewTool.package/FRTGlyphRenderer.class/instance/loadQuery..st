helper-loading
loadQuery: query

	^ (self font backend loadUfoDetails: query font: self font)
		then: [:details |
			self fontinfo: (details at: 'fontinfo').
			(details at: 'glifs') keysAndValuesDo: [:glifName :glif |
				glifs at: glifName put: (glif
					ifNotNil: [XMLDOMParser parseDocumentFrom: glif readStream]
					ifNil: [nil])].
			self]