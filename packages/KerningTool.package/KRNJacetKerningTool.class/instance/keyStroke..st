as yet unclassified
keyStroke: evt
	| key |
	key := evt keyString.
	'<left>' = key ifTrue: [ self cursorMove: 1 ].
	'<right>' = key ifTrue: [ self cursorMove: -1 ].
	'<Ctrl-left>' = key ifTrue: [ self cursorMove: 10 ].
	'<Ctrl-right>' = key ifTrue: [ self cursorMove: -10 ]