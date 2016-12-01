as yet unclassified
addGlyph: aForm for: aUnicodeValue
	glyphs at: aUnicodeValue put: {aForm. MorphicTransform identity}.
	
	aUnicodeValue ~= Character space asUnicode ifTrue: [ self addSpace ]