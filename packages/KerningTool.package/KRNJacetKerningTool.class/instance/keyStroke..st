as yet unclassified
keyStroke: evt
	| key |
	key := evt keyString.
	'<left>' = key ifTrue: [ self cursorMove: 1 ].
	'<right>' = key ifTrue: [ self cursorMove: -1 ].
	'<ctrl-left>' = key ifTrue: [  ].
	'<ctrl-right>' = key ifTrue: [  ]