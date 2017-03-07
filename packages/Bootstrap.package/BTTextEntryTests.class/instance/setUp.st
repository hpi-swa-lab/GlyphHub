as yet unclassified
setUp
	super setUp.
	
	topLevel := self horizontalTopLevel.
	textEntry := BTTextEntry new minSize: 10 @ 4.
	topLevel add: textEntry; shrink.
	
	self click: textEntry buttons: #(left)