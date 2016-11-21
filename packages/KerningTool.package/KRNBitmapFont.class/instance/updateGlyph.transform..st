as yet unclassified
updateGlyph: aNumber transform: aTransform
	| glyph |
	glyph := glyphs at: aNumber.
	glyphs at: aNumber put: {glyph first. aTransform}