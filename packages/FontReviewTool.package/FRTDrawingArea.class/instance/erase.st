drawing
erase

	self mode: #erasing.
	self pen
		roundNib: 8 * BTWidget scalingFactor;
		combinationRule: Form erase1bitShape