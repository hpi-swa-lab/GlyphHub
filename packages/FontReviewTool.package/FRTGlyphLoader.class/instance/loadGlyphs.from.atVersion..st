as yet unclassified
loadGlyphs: aGlyphNameStringCollection from: aFont atVersion: aVersionHashString

	^ BTPromise all: (aGlyphNameStringCollection collect: [:glyphName |
		self loadGlyph: glyphName from: aFont atVersion: aVersionHashString])