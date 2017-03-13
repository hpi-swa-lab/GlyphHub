as yet unclassified
testForwardDiscarded
	stack
		open: page1;
		open: page2.
	
	(self expect: stack goBack) to be: page1.
	(self expect: stack canGoForward) to be: true.
	
	stack open: page3.
	
	(self expect: stack canGoForward) to be: false