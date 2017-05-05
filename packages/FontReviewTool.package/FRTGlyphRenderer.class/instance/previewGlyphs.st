accessing
previewGlyphs
	" return promise resolving to two glyph names that may be used for a preview of the font "
	
	^ self font previewGlyphs
		ifNotEmpty: [BTPromise unit: (self font previewGlyphs splitBy: ',')]
		ifEmpty: [
			(self font backend loadUfoDetails: ({'glyphs' -> nil} as: Dictionary) font: self font)
				then: [:glyphs | self previewGlyphsFrom: (glyphs at: 'glyphs')]]