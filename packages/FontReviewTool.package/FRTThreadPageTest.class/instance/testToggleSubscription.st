testing
testToggleSubscription

	(self expect: page) to haveA: BTButton labelled: 'Subscribe'.
	
	(self expect: page toggleSubscription) to resolve.
	(self expect: page) to haveA: BTButton labelled: 'Unsubscribe'.
	
	self enterPage.
	(self expect: page) to haveA: BTButton labelled: 'Unsubscribe'.
	
	(self expect: page toggleSubscription) to resolve.
	(self expect: page) to haveA: BTButton labelled: 'Subscribe'.
	
	(self expect: page toggleSubscription) to resolve.
	(self expect: page) to haveA: BTButton labelled: 'Unsubscribe'.