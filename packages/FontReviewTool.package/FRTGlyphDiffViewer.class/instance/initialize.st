as yet unclassified
initialize

	super initialize.
	
	diff := FRTGlyphDiff new
		expand: true.
	
	self
		withLayout;
		vertical: true;
		padding: BTWidget spacing;
		add: (BTButtonGroup new
			align: #(center center);
			add: (BTButton icon: #adjust);
			add: (BTButton icon: #columns);
			add: (BTButton icon: #film));
		add: diff