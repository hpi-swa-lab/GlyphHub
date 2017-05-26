accessing
sortedGlyphs

	^ (self threadGlyphAssociations sortedBy: #stringIndex) collect: [:each | each glyph]