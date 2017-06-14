drawing
loadDataFor: aGlyphNameStringCollection
	" prepare this renderer for drawing all glyph names. returns a promise. "

	^ self glyphLoader loadGlyphs: aGlyphNameStringCollection from: self font atVersion: self font latestVersionHash