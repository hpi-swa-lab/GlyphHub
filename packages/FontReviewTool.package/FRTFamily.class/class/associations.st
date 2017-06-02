accessing
associations

	^ {
		#fonts -> (BTModelAssociation manyAssociationTo: FRTFont backPopulatesVia: #family).
		#tags -> (BTModelAssociation manyAssociationTo: FRTTag backPopulatesVia: #families).
		#standardSampleText -> (BTModelAssociation singleAssociationTo: FRTSampleText backPopulatesVia: #families).
		#author -> (BTModelAssociation singleAssociationTo: FRTUser backPopulatesVia: #families)
	} as: Dictionary