accessing
loadAllGlyphNames

	^ (self backend loadUfoDetails: {'glyphs' -> nil} font: self)
		then: [:data | (data at: 'glyphs') keys]