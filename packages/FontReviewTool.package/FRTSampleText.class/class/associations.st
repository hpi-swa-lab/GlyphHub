accessing
associations

	^ {
		#author -> (BTModelAssociation singleAssociationTo: FRTUser backPopulatesVia: #sampleTexts).
		#tags -> (BTModelAssociation manyAssociationTo: FRTTag backPopulatesVia: #sampleTexts).
		#families -> (BTModelAssociation manyAssociationTo: FRTFamily backPopulatesVia: #standardSampleText)
	} as: Dictionary