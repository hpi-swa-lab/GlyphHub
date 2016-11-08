accessing
detailViewText

	| startIndex stopIndex cursorIndex |
	cursorIndex := self targetView submorphIndexOf: self cursor.
	startIndex :=  self text size - cursorIndex + 1 clampLow: 1 high: self text size - 1.
	stopIndex :=  startIndex + 1 clampLow: 1 high: self text size.
	self text size < 2 ifTrue: [ ^''  ].
	^ self text copyFrom: startIndex to: stopIndex.
