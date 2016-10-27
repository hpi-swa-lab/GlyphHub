as yet unclassified
cursorChanged: newIndex

	| startIndex stopIndex text |
	startIndex :=  self text size - newIndex + 1 clampLow: 1 high: self text size - 1.
	stopIndex :=  startIndex + 1 clampLow: 1 high: self text size.
	text := self text copyFrom: startIndex to: stopIndex.

	self updateDetailView: text