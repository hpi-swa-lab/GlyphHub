as yet unclassified
testOnlyMouseDown
	| clickable |
	clickable := self clickableWidget.

	(self expect: clickable) to not send: #clicked.
 	
	self
		mousePress: clickable buttons: #(left);
		checkSpies