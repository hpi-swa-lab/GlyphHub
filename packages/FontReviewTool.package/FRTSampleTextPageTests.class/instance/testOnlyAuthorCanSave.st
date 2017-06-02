testing
testOnlyAuthorCanSave

	self topLevel user: sampleText author.
	self enterPage.

	(self expect: page saveButton visible) to be: true.
	
	self topLevel user: self mockUserOther.
	self enterPage.
	(self expect: page saveButton visible) to be: false