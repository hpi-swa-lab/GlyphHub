as yet unclassified
testValidations
	| penguin |
	penguin := BTPenguinModel new age: -99.

	(self expect: penguin isValid) to be: false.

	(self expect: (penguin saveTo: backend)) to reject