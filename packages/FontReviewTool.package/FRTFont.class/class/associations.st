accessing
associations

	^ {
		#author -> (BTModelAssociation singleAssociationTo: FRTUser backPopulatesVia: #fonts).
		#family -> (BTModelAssociation singleAssociationTo: FRTFamily backPopulatesVia: #fonts).
		#codepoints -> (BTModelAssociation manyAssociationTo: FRTCodepoint backPopulatesVia: #font).
		#glyphs -> (BTModelAssociation manyAssociationTo: FRTGlyph backPopulatesVia: #font).
		#tags -> (BTModelAssociation manyAssociationTo: FRTTag backPopulatesVia: #fonts)
	} as: Dictionary