as yet unclassified
testMouseDownAndUp
	| clickable |
	clickable := self clickableWidget.
	
	(self expect: clickable) to send: #clicked.

	self
		mousePress: clickable buttons: #(left);
		mouseRelease: clickable buttons: #(left);
		checkSpies