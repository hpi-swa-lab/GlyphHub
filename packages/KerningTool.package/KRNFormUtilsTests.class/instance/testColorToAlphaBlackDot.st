as yet unclassified
testColorToAlphaBlackDot
	| f |
	f := (Form extent: 3 @ 3 depth: 32) fillColor: Color white;
		colorAt: 1 @ 1 put: Color black;
		colorToAlpha: Color white.

	" FIXME internal serialization makes 0,0,1 black instead of 0,0,0 which means transparent.
	  this compare works around that "
	self assert: Color black printHtmlString equals: (f colorAt: 1 @ 1) printHtmlString