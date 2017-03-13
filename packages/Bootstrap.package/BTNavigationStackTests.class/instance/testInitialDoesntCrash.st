as yet unclassified
testInitialDoesntCrash
	(self expect: [stack goBack]) to not raise: Error.  
	(self expect: [stack goForward]) to not raise: Error