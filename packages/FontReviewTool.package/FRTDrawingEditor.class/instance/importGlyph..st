initialize-release
importGlyph: aGlifFilenameString

	self importGlyphs: {aGlifFilenameString allButLast: 5} font: self font.
	glyphImport delete