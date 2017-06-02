operations
loadGlif

	^ (self backend loadUfoDetails: {'glifs' -> {self glyphName}} font: self font)
		then: [:info | (info at: 'glifs') at: self glyphName]