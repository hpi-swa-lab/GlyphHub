as yet unclassified
testGoBack
	stack
		open: page1;
		open: page2.
	
	(self expect: stack canGoForward) to be: false.
	
	(self expect: stack goBack) to be: page1.
	
	(self expect: stack canGoBack) to be: false