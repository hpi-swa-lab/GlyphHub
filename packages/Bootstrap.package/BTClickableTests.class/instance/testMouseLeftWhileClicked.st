as yet unclassified
testMouseLeftWhileClicked
	| clickable |
	clickable := self clickableWidget.

	(self expect: clickable) toNot; send: #clicked.
 	
	self
		mousePress: clickable buttons: #(left);
		mouseLeave: clickable;
		mouseRelease: clickable buttons: #(left);
		checkSpies