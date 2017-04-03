as yet unclassified
testAssociations1toN
	| penguin |
	
	penguin := (BTPenguinModel load: 1 populate: #(eggs) from: backend) value.
	
	(self expect: penguin eggs) to beEmpty.
	
	penguin eggs
		add: BTEggModel new;
		add: BTEggModel new.

	(self expect: penguin eggs anyOne parent) to be: penguin.
	
	self safePromise: (penguin saveTo: backend).
	
	penguin := (BTPenguinModel load: 1 populate: #(eggs) from: backend) value.
	(self expect: penguin eggs size) to be: 2.
	(self expect: penguin eggs anyOne parent id) to equal: penguin id