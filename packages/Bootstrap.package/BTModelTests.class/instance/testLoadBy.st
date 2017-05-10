as yet unclassified
testLoadBy
	3 timesRepeat: [
		BTPenguinModel new age: 4; saveTo: backend ].
	
	(BTPenguinModel loadWhere: #age equals: 4 from: backend populate: #()) whenResolved: [ :models |
		(self expect: models size) to equal: 3 ]