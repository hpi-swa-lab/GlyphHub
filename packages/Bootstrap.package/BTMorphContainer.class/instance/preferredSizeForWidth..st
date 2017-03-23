layout
preferredSizeForWidth: aNumber
	| size |
	size := self firstSubmorph extent.
	^{size. size}