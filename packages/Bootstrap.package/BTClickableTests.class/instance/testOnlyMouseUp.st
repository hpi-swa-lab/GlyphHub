as yet unclassified
testOnlyMouseUp
	| clickable |
	clickable := self clickableWidget.
	
	(self expect: clickable) to not send: #clicked.
	
 	self
		mouseRelease: clickable buttons: #(left);
		checkSpies