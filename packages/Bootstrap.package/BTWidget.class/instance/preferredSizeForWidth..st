layout
preferredSizeForWidth: aNumber

	^ requestCache
		lookupForWidth: aNumber
		ifMissing: [self calculateSizeForWidth: aNumber].

	"please don't delete either of this"
	"^ self calculateSizeForWidth: aNumber"