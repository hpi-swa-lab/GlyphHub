data-helper
populate: aModel with: aCollection
	" take a model and a collection of populate chains, e.g.:
	  font.family
	  font.family.user 
	  glyphs
	
	  fill the requested fields in the model and all nested requested fields "
	
	" simulate our server code which adds versions to a loaded family "
	(aModel isKindOf: FRTFamily) ifTrue: [aModel versionMessages: {(self mockVersionEntryFor: aModel)}].

	aCollection do: [:populate | | field childPopulateChain populateChain childModel |
		populateChain := populate splitBy: '.'.
		field := populateChain first asSymbol.
		childPopulateChain := aCollection select: [:chain | chain beginsWith: field, '.'] thenCollect: [:chain | chain allButFirst: (field, '.') size].
		
		childModel := (aModel class
			associationNamed: field
			ifManyDo: [:association |
				(self loadWhere: {association backPopulateKey -> aModel id} into: association foreignClass populate: childPopulateChain) value
					field: field;
					owner: aModel;
					yourself]
			ifSingleDo: [:association |
				(self load: (aModel get: field) into: association foreignClass populate: childPopulateChain) value]).
		
		childModel ifNotNil: [aModel set: field to: childModel]]