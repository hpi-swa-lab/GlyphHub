navigation
openNewPage: aPageClass with: anObject
	
	^ aPageClass
		ifNotNil: [self openPage: aPageClass new with: anObject]
		ifNil: [BTPromise unit: nil]