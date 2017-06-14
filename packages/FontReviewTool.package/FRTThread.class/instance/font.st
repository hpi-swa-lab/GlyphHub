accessing
font

	self threadGlyphAssociations do: [:each |
		(each glyph notNil and: [each glyph font notNil]) ifTrue: [^ each glyph font]].
	
	self error: 'Thread does not have any glyphs that belong to a font / font is not populated.'