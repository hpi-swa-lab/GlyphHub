as yet unclassified
initialize
	fontinfo := KRNPlistFile newForPath: (self path / 'fontinfo.plist') fullName.
	kerning := KRNPlistFile newForPath: (self path / 'kerning.plist') fullName.
	metainfo := KRNPlistFile newForPath: (self path / 'metainfo.plist') fullName.
	glyphContents := KRNPlistFile newForPath: (self path / 'glyphs' / 'contents.plist') fullName