accessing
associations

	^ {
		#author -> (BTModelAssociation singleAssociationTo: FRTUser backPopulatesVia: #comments).
		#thread -> (BTModelAssociation singleAssociationTo: FRTThread backPopulatesVia: #comments)
	} as: Dictionary