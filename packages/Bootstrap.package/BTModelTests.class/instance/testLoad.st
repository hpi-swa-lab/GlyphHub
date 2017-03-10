as yet unclassified
testLoad
	(BTPenguinModel load: 1 from: backend) then: [ :model |
		(self expect: model isDirty) to be: false.
		(self expect: model id) to equal: 1.
		(self expect: model isCreated) to be: true ]