accessing
associations

	^ {
		#fonts -> (BTModelAssociation manyAssociationTo: FRTFont backPopulatesVia: #family).
		#tags -> (BTModelAssociation manyAssociationTo: FRTTag backPopulatesVia: #families)
	} as: Dictionary