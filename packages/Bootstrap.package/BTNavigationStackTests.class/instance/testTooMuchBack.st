as yet unclassified
testTooMuchBack
	stack
		open: page1;
		open: page2.
	
	(self expect: [stack goBack: 42]) to not raise: Error