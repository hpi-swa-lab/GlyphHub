as yet unclassified
initialize
	fontinfo := (KRNPListConverter deserialize: (self path / 'fontinfo.plist') fullName) content.
	kerning := (KRNPListConverter deserialize: (self path / 'kerning.plist') fullName) content.
	metainfo := (KRNPListConverter deserialize: (self path / 'metainfo.plist') fullName) content.
	glyphContents := (KRNPListConverter deserialize: (self path / 'glyphs' / 'contents.plist') fullName) content.
	
	glyphs := OrderedDictionary new.
	codePointsTable := Dictionary new.
	
	glyphContents keysAndValuesDo: [ :key :glifPath | | glif |
		FileDirectory default readOnlyFileNamed: (self path / 'glyphs' / glifPath) fullName do: [ :stream |
			glif := (XMLDOMParser parseDocumentFrom: stream) root.
			glyphs at: key put: glif.
			glif tagsNamed: #unicode do: [ :c | codePointsTable at: ('16r', (c attributeAt: #hex)) asNumber put: glif ]]]