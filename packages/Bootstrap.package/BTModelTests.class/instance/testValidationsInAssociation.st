as yet unclassified
testValidationsInAssociation

	| penguin otherPenguin |
	penguin := BTPenguinModel new.
	otherPenguin := BTPenguinModel new age: -42.

	penguin significantOther: otherPenguin.

	(self expect: penguin isValid) to be: false.
	(self expect: (penguin saveTo: backend)) to reject.
	(self expect: penguin isCreated) to be: false