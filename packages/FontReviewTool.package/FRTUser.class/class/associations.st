accessing
associations

	^ {
		#comments -> (BTModelAssociation manyAssociationTo: FRTComment backPopulatesVia: #author).
		#fonts -> (BTModelAssociation manyAssociationTo: FRTFont backPopulatesVia: #author).
		#attachments -> (BTModelAssociation manyAssociationTo: FRTAttachment backPopulatesVia: #owner).
		#sampleTexts -> (BTModelAssociation manyAssociationTo: FRTSampleText backPopulatesVia: #author)
	} as: Dictionary