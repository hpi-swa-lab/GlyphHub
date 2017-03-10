as yet unclassified
testSaveUpdate
	| model |
	model := ((BTPenguinModel load: 1 from: backend) value 
		name: 'Rico';
		saveTo: backend) value.
	
	(self expect: model isDirty) to be: false