accessing
associations

	^ {
		#author -> (BTModelAssociation singleAssociationTo: FRTUser backPopulatesVia: #comments).
		#thread -> (BTModelAssociation singleAssociationTo: FRTThread backPopulatesVia: #comments).
		#attachments -> (BTModelAssociation manyAssociationTo: FRTAttachment backPopulatesVia: #comment)
	} as: Dictionary