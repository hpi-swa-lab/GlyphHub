accessing
associations
	
	^ {
		#threadGlyphAssociations -> (BTModelAssociation manyAssociationTo: FRTThreadGlyphAssociation backPopulatesVia: #thread).
		#codepoints -> (BTModelAssociation manyAssociationTo: FRTCodepoint backPopulatesVia: #thread).
		#comments -> (BTModelAssociation manyAssociationTo: FRTComment backPopulatesVia: #thread).
		#tags -> (BTModelAssociation manyAssociationTo: FRTTag backPopulatesVia: #threads)
	} as: Dictionary