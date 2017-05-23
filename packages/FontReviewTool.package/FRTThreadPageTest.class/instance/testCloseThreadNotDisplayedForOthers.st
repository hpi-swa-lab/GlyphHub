testing
testCloseThreadNotDisplayedForOthers
	
	self changeLoggedInUserToOther.
	self enterPage.
	(self expect: page closeButton visible) to be: false.
	(self expect: page thread closed) to be: false