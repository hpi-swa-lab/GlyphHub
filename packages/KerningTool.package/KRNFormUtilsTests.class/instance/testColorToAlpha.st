as yet unclassified
testColorToAlpha
	| f |
	f := (Form extent: 1 asPoint depth: 32) fillColor: Color red.

	self assert: Color transparent equals: ((f colorToAlpha: Color red) colorAt: 0 @ 0)