as yet unclassified
associations
	^{
		#eggs -> (BTModelAssociation manyAssociationTo: BTEggModel backPopulatesVia: #parent).
		#significantOther -> (BTModelAssociation singleAssociationTo: BTPenguinModel backPopulatesVia: #significantOther).
		#favoritePubs -> (BTModelAssociation manyAssociationTo: BTPubModel backPopulatesVia: #penguins)
	} as: Dictionary