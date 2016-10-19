as yet unclassified
initialize
	fontinfo := KRNPlistFile newForPath: (self path / 'fontinfo.plist') fullName.
	kerning := KRNPlistFile newForPath: (self path / 'kerning.plist') fullName.
	metainfo := KRNPlistFile newForPath: (self path / 'metainfo.plist') fullName.
	glyphContents := KRNPlistFile newForPath: (self path / 'glyphs' / 'contents.plist') fullName.
	
	glyphs := OrderedDictionary new.
	codePointsTable := Dictionary new.
	
	glyphContents keysAndValuesDo: [ :key :path |
		glyphs at: key put: (KRNGlyph newForPath: (self path / 'glyphs' / path) fullName from: self) ]