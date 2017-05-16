accessing
associations

	^ {
		#author -> (BTModelAssociation singleAssociationTo: FRTUser backPopulatesVia: #feedbackSubmissions)
	} as: Dictionary