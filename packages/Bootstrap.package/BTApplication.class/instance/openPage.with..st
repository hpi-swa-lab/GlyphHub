navigation
openPage: aPage with: anObject
	
	self startLoadingOperation.
	^ (self navigationStack open: aPage with: anObject)
		then: [self stopLoadingOperation]
		ifRejected: [self stopLoadingOperation]