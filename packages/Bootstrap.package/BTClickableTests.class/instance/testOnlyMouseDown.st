as yet unclassified
testOnlyMouseDown
	| clickable |
	clickable := self clickableWidget.

	(self expect: clickable) toNot; send: #clicked.
 	
	self
		mousePress: clickable buttons: #(left);
		checkSpies