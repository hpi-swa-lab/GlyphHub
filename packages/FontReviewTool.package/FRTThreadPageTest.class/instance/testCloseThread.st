testing
testCloseThread

	(self expect: page) to haveA: BTButton labelled: 'Close Thread'.
	(self expect: page toggleClosed) to resolve.
	(self expect: self topLevel openPage class) to be: FRTFontPage.
	
	self enterPage.
	
	(self expect: page) to haveA: BTButton labelled: 'Re-Open Thread'.
	(self expect: page toggleClosed) to resolve.
	
	self enterPage.
	(self expect: page) to haveA: BTButton labelled: 'Close Thread'