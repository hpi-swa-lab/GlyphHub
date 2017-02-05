as yet unclassified
keyStroke: anEvent
	| key |
	key := anEvent keyString.

	Transcript show: key; cr.
	key = '<backspace>' ifTrue: [
		^self deleteBeforeCursor ].
	key = '<delete>' ifTrue: [
		^self deleteAfterCursor ].
	key = '<left>' ifTrue: [
		^self moveCursor: true direction: -1 ].
	key = '<right>' ifTrue: [
		^self moveCursor: true direction: 1 ].
	key = '<home>' ifTrue: [
		^self cursor: 0 ].
	key = '<end>' ifTrue: [
		^self cursor: self text size ].
	
	self insertAtCursor: anEvent keyCharacter.
	self cursor: cursor + 1