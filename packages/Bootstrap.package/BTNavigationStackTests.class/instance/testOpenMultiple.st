as yet unclassified
testOpenMultiple
	stack
		open: page1;
		open: page2.
	
	(self expect: stack canGoForward) to be: false.
	(self expect: stack canGoBack) to be: true