change reporting
cursorChanged: newIndex
	| startIndex stopIndex shownText |
	self text size > 1 ifTrue: [
		startIndex :=  self text size - newIndex + 1 clampLow: 1 high: self text size - 1.
		stopIndex :=  startIndex + 1 clampLow: 1 high: self text size.
	
		shownText := self text copyFrom: startIndex to: stopIndex.

		self updateDetailView: shownText ]