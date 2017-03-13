as yet unclassified
testTooMuchForward
	stack
		open: page1;
		open: page2.
	
	(self expect: [stack goForward: 42]) to not raise: Error