as yet unclassified
testColorToAlphaBlackAndWhite
	| f |
	f := (Form extent: 2 @ 1 depth: 32)
		colorAt: 0 @ 0 put: Color white;
		colorAt: 1 @ 0 put: Color black;
		yourself.

"	self assert: Color black equals: (f colorAt: 1 @ 0)."
	
	f := f colorToAlpha: Color white.

	self
		assert: Color transparent equals: (f colorAt: 0 @ 0);
		assert: Color black printHtmlString equals: (f colorAt: 1 @ 0) printHtmlString