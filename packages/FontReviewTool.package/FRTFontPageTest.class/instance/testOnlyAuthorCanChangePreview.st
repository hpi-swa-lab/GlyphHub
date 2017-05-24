testing
testOnlyAuthorCanChangePreview

	self setUpForDefaultFamily.
	self topLevel user: font author.
	self enterPage.

	(self expect: page) to haveA: BTAlert labelled: 'You haven''t selected preview glyphs for this font yet.'.
	
	self setUpForDefaultFamily.
	self topLevel user: self mockUserOther.
	self enterPage.
	(self expect: page) to not haveA: BTAlert labelled: 'You haven''t selected preview glyphs for this font yet.'