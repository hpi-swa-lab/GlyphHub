as yet unclassified
initialize
	fontinfo := KRNPlistFile newForPath: (self path / 'fontinfo.plist') fullName.
	kerning := KRNPlistFile newForPath: (self path / 'kerning.plist') fullName.
	metainfo := KRNPlistFile newForPath: (self path / 'metainfo.plist') fullName.
	glyphContents := KRNPlistFile newForPath: (self path / 'glyphs' / 'contents.plist') fullName.
	
	glyphs := OrderedDictionary new.
	codePointsTable := Dictionary new.
	
	glyphContents keysAndValuesDo: [ :key :glifPath | | glif |
		FileDirectory default readOnlyFileNamed: (self path / 'glyphs' / glifPath) fullName do: [ :stream |
			glif := (XMLDOMParser parseDocumentFrom: stream) root.
			glyphs at: key put: glif.
			glif tagsNamed: #unicode do: [ :c | codePointsTable at: ('16r', (c attributeAt: #hex)) asNumber put: glif ]]]