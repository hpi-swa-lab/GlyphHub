as yet unclassified
testAssociations1to1Strong
	| penguin1 penguin2 |
	penguin1 := BTPenguinModel new name: 'Rico'.
	penguin2 := BTPenguinModel new name: 'Paula'.
	
	penguin1 significantOther: penguin2.
	
	(self expect: penguin1 significantOther) to be: penguin2.
	(self expect: penguin2 significantOther) to be: penguin1.
	
	penguin1 saveTo: backend.
	
	(self expect: penguin1 isCreated) to be: true.
	(self expect: penguin2 isCreated) to be: true