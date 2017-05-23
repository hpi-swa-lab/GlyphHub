testing
testCloseThreadDisplayedForFontOwner
		
	self changeLoggedInUserToThreadFontAuthor.
	self enterPage.
	(self expect: page closeButton visible) to be: true.
	self clickCloseButton.
	(self expect: page thread closed) to be: true 