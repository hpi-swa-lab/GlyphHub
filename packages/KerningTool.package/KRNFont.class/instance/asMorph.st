as yet unclassified
asMorph
	^Morph new
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		cellInset: 12;
		color: Color transparent;
		addMorph: self name asMorph;
		addMorph: (self thumbnailForm: 64) asMorph