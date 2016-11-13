as yet unclassified
testColorToAlphaHalfEffect
	| f |
	f := (Form extent: 1 asPoint depth: 32) fillColor: (Color fromString: '#FF8000').

	self assert: (Color yellow alpha: 0.5) equals: ((f colorToAlpha: Color red) colorAt: 0 @ 0)