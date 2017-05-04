drawing
erase

	self mode: #erase.
	self pen
		roundNib: 8 * BTWidget scalingFactor;
		combinationRule: Form erase1bitShape