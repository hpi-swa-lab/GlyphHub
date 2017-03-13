as yet unclassified
testGoForward
	stack
		open: page1;
		open: page2.
	
	(self expect: stack goBack) to be: page1.
	
	(self expect: stack canGoForward) to be: true.
	(self expect: stack goForward) to be: page2