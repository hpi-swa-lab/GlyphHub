as yet unclassified
initialize
	fontinfo := self tryLoadPList: 'fontinfo.plist'.
	kerning := self tryLoadPList: 'kerning.plist'.
	metainfo := self tryLoadPList: 'metainfo.plist'.
	groups := self tryLoadPList: 'groups.plist'.
	glyphContents := (KRNPListConverter deserialize: (self path / 'glyphs' / 'contents.plist') fullName) content.
	glyphs := OrderedDictionary new.
	codePointsTable := Dictionary new.
	
	glyphContents keysAndValuesDo: [ :key :glifPath | | glif |
		FileDirectory default readOnlyFileNamed: (self path / 'glyphs' / glifPath) fullName do: [ :stream |
			glif := (XMLDOMParser parseDocumentFrom: stream) root.
			glyphs at: key put: glif.
			glif tagsNamed: #unicode do: [ :c | codePointsTable at: ('16r', (c attributeAt: #hex)) asNumber put: glif ]]]