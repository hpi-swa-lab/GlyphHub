as yet unclassified
testMouseLeftWhileClicked
	| clickable |
	clickable := self clickableWidget.

	(self expect: clickable) to not send: #clicked.
 	
	self
		mousePress: clickable buttons: #(left);
		mouseLeave: clickable;
		mouseRelease: clickable buttons: #(left);
		checkSpies