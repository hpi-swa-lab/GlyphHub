as yet unclassified
testLoadBy
	3 timesRepeat: [
		BTPenguinModel new age: 4; saveTo: backend ].
	
	(BTPenguinModel loadBy: #age value: 4 from: backend) whenResolved: [ :models |
		(self expect: models size) to equal: 3 ]