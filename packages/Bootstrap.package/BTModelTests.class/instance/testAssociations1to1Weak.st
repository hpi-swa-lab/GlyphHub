as yet unclassified
testAssociations1to1Weak
	| beak newBeak penguin |
	penguin := BTPenguinModel new.
	beak := BTBeakModel new.
	
	penguin beak: beak.
	beak saveTo: backend.
	
	(self expect: penguin isCreated) not to be: true.
	(self expect: beak isCreated) to be: true.
	
	newBeak := BTBeakModel new.
	
	penguin beak: newBeak.
	penguin saveTo: backend.
	
	(self expect: penguin isCreated) to be: true.
	(self expect: beak isCreated) to be: true