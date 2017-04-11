as yet unclassified
associations

	^ {
		#thread -> (BTModelAssociation singleAssociationTo: FRTThread backPopulatesVia: #threadGlyphAssociations).
		#glyph -> (BTModelAssociation singleAssociationTo: FRTGlyph backPopulatesVia: #threadGlyphAssociations)
	} as: Dictionary