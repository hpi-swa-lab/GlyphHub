as yet unclassified
testLoadAll
	(BTPenguinModel loadAllFrom: backend populate: #()) whenResolved: [ :models |
		models do: [ :model |
			(self expect: model isDirty) to be: false.
			(self expect: model isCreated) to be: true ]]