as yet unclassified
loadGlyph: aGlyphNameString from: aFont atVersion: aVersionHashString

	^ (self loadGlyphs: {aGlyphNameString} from: aFont atVersion: aVersionHashString)
		then: #first