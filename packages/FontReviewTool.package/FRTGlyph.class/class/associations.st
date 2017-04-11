accessing
associations

	^ {
		#font ->  (BTModelAssociation singleAssociationTo: FRTFont backPopulatesVia: #glyphs).
		#threadGlyphAssociations ->  (BTModelAssociation manyAssociationTo: FRTThreadGlyphAssociation backPopulatesVia: #glyph)
	} as: Dictionary