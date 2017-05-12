testing
testDisplaysDefaultFontTitle

	self setUpForDefaultFamily.
	(self expect: page) to haveText: family defaultFont fontName