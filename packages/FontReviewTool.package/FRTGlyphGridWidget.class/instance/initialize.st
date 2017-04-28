initialize-release
initialize
	
	super initialize.
	self
		pointSize: 36;
		renderer: FRTGlyphRenderer new;
		layoutPolicy: (FRTFixedGridLayout cellSize: 64);
		spacing: BTWidget spacing / 2