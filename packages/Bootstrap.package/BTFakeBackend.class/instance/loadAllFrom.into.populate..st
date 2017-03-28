as yet unclassified
loadAllFrom: aString into: aClass populate: aCollection
	| models |
	models := (tables at: aString) collect: [ :entity | self deserialize: entity class: aClass ].

	self join: models class: aClass populate: aCollection.
	
	^Promise unit: models