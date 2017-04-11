accessing
associations
	
	^ {
		#thread -> (BTModelAssociation singleAssociationTo: FRTThread backPopulatesVia: #codepoints).
		#font -> (BTModelAssociation singleAssociationTo: FRTFont backPopulatesVia: #codepoints)
	} as: Dictionary