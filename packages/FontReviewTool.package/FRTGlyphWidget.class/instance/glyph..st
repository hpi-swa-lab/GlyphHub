accessing
glyph: aGlyphModel
	"shortcut function to display a single glyph"

	aGlyphModel font ifNotNil: [self font: aGlyphModel font].

	self glyphNames: {aGlyphModel glyphName}