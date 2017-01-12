as yet unclassified
initialize
	fontinfo := self tryLoadPList: 'fontinfo.plist'.
	kerning := self tryLoadPList: 'kerning.plist'.
	metainfo := self tryLoadPList: 'metainfo.plist'.
	groups := self tryLoadPList: 'groups.plist'.
	glyphContents := (KRNPListConverter deserialize: (self path / 'glyphs' / 'contents.plist') fullName) content.
	glyphs := OrderedDictionary new.
	codePointsTable := Dictionary new.
	self glyphFlyweights: Dictionary new.
	
	glyphContents keysAndValuesDo: [ :key :glifPath | | glif |
		FileDirectory default readOnlyFileNamed: (self path / 'glyphs' / glifPath) fullName do: [ :stream |
			glif := (XMLDOMParser parseDocumentFrom: stream) root.
			glyphs at: (glif attributeAt: #name) put: glif.
			glif tagsNamed: #unicode do: [ :c | | unicode |
				unicode := ('16r', (c attributeAt: #hex)) asNumber.
				codePointsTable at: unicode put: glif.
				self glyphFlyweights at: unicode put: (KRNVectorData newForXML: glif from: self)]]].
	glyphFlyweights valuesDo: [ :dataObject |
		dataObject postInitialize]