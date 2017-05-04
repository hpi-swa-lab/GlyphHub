drawing
penColor: aColor

	penColor := aColor.
	
	self mode == #paint ifTrue: [
		pen
			roundNib: 4 * BTWidget scalingFactor;
			combinationRule: Form paint;
			color: aColor]