as yet unclassified
mouseDown: evt
	self ref: self center - evt position
	"evt hand waitForClicksOrDrag: self event: evt"