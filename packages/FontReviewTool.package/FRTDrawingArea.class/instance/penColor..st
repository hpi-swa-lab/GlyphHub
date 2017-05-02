as yet unclassified
penColor: aColor

	penColor := aColor.
	self mode == #painting ifTrue: [pen color: aColor]