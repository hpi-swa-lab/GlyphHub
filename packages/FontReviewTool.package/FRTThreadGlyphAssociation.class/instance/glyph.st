accessing
glyph

	glyph
		ifNotNil: [^ glyph]
		ifNil: [^ FRTUndefinedGlyph new]