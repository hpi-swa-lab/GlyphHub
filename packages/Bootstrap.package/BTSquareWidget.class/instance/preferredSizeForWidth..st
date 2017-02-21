as yet unclassified
preferredSizeForWidth: aNumber
	| size |
	size := (aNumber max: minSize x) asPoint.
	^{minSize x asPoint. size}