initialize-release
initialize
	
	super initialize.
	self
		renderer: FRTGlyphRenderer new;
		layoutPolicy: (FRTFixedGridLayout cellSize: 64);
		spacing: BTWidget spacing / 2