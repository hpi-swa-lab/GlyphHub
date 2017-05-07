as yet unclassified
associations

	^ {
		#thread -> (BTModelAssociation singleAssociationTo: FRTThread backPopulatesVia: #threadSubscriptions).
		#user -> (BTModelAssociation singleAssociationTo: FRTUser backPopulatesVia: #threadSubscriptions)
	} as: Dictionary