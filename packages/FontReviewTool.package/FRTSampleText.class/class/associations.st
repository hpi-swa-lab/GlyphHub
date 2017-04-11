accessing
associations

	^ {
		#author -> (BTModelAssociation singleAssociationTo: FRTUser backPopulatesVia: #sampleTexts).
		#tags -> (BTModelAssociation manyAssociationTo: FRTTag backPopulatesVia: #sampleTexts)
	} as: Dictionary