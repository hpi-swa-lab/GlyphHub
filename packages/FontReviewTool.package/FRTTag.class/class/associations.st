accessing
associations

	^ {
		#sampleTexts -> (BTModelAssociation manyAssociationTo: FRTSampleText backPopulatesVia: #tags).
		#threads ->(BTModelAssociation manyAssociationTo: FRTThread backPopulatesVia: #tags).
		#fonts -> (BTModelAssociation manyAssociationTo: FRTFont backPopulatesVia: #tags).
		#families -> (BTModelAssociation manyAssociationTo: FRTFamily backPopulatesVia: #tags)
	} as: Dictionary