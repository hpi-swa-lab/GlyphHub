as yet unclassified
mouseDown: evt
	ref := self topLeft - evt position
	"evt hand waitForClicksOrDrag: self event: evt"