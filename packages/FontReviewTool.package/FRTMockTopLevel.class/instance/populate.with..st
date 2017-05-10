as yet unclassified
populate: aModel with: aCollection
	" take a model and a collection of populate chains, e.g.:
	  font.family
	  font.family.user 
	  glyphs
	
	  fill the requested fields in the model and all nested requested fields "

	aCollection do: [:populate | | field childPopulateChain populateChain childModelPromise |
		populateChain := populate splitBy: '.'.
		field := populateChain first asSymbol.
		childPopulateChain := aCollection select: [:chain | chain beginsWith: field, '.'] thenCollect: [:chain | chain allButFirst: (field, '.') size].
		
		childModelPromise := (aModel class
			associationNamed: field
			ifManyDo: [:association |
				self loadWhere: {association backPopulateKey -> aModel id} into: association foreignClass populate: childPopulateChain]
			ifSingleDo: [:association |
				self load: (aModel perform: field) into: association foreignClass populate: childPopulateChain]).
		
		childModelPromise value ifNotNilDo: [:childModel | aModel perform: field asMutator with: childModel]]