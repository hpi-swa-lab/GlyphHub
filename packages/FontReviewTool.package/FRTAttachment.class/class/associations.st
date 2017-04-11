accessing
associations

	^ {
		#comment -> (BTModelAssociation singleAssociationTo: FRTComment backPopulatesVia: #attachments).
		#owner -> (BTModelAssociation singleAssociationTo: FRTUser backPopulatesVia: #attachments)
	} as: Dictionary