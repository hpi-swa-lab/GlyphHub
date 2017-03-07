as yet unclassified
testOnlyMouseUp
	| clickable |
	clickable := self clickableWidget.
	
	(self expect: clickable) toNot; send: #clicked.
	
 	self
		mouseRelease: clickable buttons: #(left);
		checkSpies