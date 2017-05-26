drawing
loadDataForAllGlyphs
	" prepare this renderer for drawing all glyph names. returns a promise. "
	
	^ self glyphLoader loadAllGlyphsFrom: self font atVersion: self font latestVersionHash