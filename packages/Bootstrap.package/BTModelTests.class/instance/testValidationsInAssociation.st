as yet unclassified
testValidationsInAssociation
	| penguin beak |
	penguin := BTPenguinModel new.
	beak := BTBeakModel new color: 'Green'.

	penguin beak: beak.

	(self expect: penguin isValid) to be: false.
	(self expect: (penguin saveTo: backend)) to reject.
	(self expect: penguin isCreated) to be: false