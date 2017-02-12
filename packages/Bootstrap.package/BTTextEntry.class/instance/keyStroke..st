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
		^self moveCursor: true direction: -1 selecting: false ].
	key = '<Shift-left>' ifTrue: [
		^self moveCursor: true direction: -1 selecting: true ].
	key = '<right>' ifTrue: [
		^self moveCursor: true direction: 1 selecting: false ].
	key = '<Shift-right>' ifTrue: [
		^self moveCursor: true direction: 1 selecting: true ].
	key = '<home>' ifTrue: [
		^self cursor: 0 ].
	key = '<end>' ifTrue: [
		^self cursor: self text size ].
	key = '<tab>' ifTrue: [
		^self tabHitWithEvent: anEvent ].
	key = '<Cmd-a>' ifTrue: [
		^self selectAll ].
	key = '<Cmd-c>' ifTrue: [
		^Clipboard clipboardText: self selectedText ].
	key = '<Cmd-v>' ifTrue: [
		^self insertAtCursor: Clipboard clipboardText ].
	key = '<Cmd-x>' ifTrue: [
		^Clipboard clipboardText: self selectedText ].
	key = '<escape>' ifTrue: [
		^escapeDo ifNotNil: [ escapeDo valueWithEnoughArguments: {self}  ]].
	key = '<cr>' ifTrue: [
		returnDo ifNotNil: [ (returnDo valueWithEnoughArguments: {self}) ifNil: [ ^self ]]].
	
	(anEvent controlKeyPressed or: [anEvent commandKeyPressed]) ifFalse: [
		self insertAtCursor: anEvent keyCharacter.
		self placeCursorAt: self cursor + 1 ]