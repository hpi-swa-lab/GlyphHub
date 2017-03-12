as yet unclassified
testPopulated1toN
	| penguin egg |
	penguin := (BTPenguinModel load: 1 from: backend) value.
	
	penguin eggs add: BTEggModel new.
	penguin saveTo: backend.
	
	egg := (BTEggModel load: 1 from: backend) value.
	(self expect: egg parent) to be: penguin