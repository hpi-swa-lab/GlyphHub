layout
preferredSizeForWidth: aNumber

	^ requestCache
		lookupForWidth: aNumber
		ifMissing: [self calculateSizeForWidth: aNumber].

	"^ self calculateSizeForWidth: aNumber"