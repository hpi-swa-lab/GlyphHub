accessing
associations

	^ {
		#comments -> (BTModelAssociation manyAssociationTo: FRTComment backPopulatesVia: #author).
		#fonts -> (BTModelAssociation manyAssociationTo: FRTFont backPopulatesVia: #author).
		#attachments -> (BTModelAssociation manyAssociationTo: FRTAttachment backPopulatesVia: #owner).
		#sampleTexts -> (BTModelAssociation manyAssociationTo: FRTSampleText backPopulatesVia: #author).
		#threadSubscriptions -> (BTModelAssociation manyAssociationTo: FRTThreadSubscription backPopulatesVia: #user).
		#feedbackSubmissions -> (BTModelAssociation manyAssociationTo: FRTFeedback backPopulatesVia: #author)
	} as: Dictionary