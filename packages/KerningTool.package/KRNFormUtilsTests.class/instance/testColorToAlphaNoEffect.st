as yet unclassified
testColorToAlphaNoEffect
	| f |
	f := (Form extent: 1 asPoint depth: 32) fillColor: Color red.

	self assert: Color red equals: ((f colorToAlpha: Color green) colorAt: 0 @ 0)