as yet unclassified
testEmptyCreate
	| model |
	model := BTPenguinModel new.
	
	(self expect: model isDirty) to be: true.
	(self expect: model id) to equal: 0.
	(self expect: model isCreated) to be: false