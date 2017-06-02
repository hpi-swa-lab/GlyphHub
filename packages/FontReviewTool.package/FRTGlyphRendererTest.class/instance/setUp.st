as yet unclassified
setUp

	| font |
	super setUp.
	
	renderer := FRTGlyphRenderer new
		font: (font := self mockFont).
	
	self setUpWithoutPagePrepare: [:topLevel |
		topLevel
			addEntity: font;
			extraGlifs: {
				'singleClosedCurve' -> self glifSingleClosedCurve.
				'smallClosedCurve' -> self glifSmallClosedCurve}.
				
		(self expect: renderer loadDataForAllGlyphs) to resolve]
	
