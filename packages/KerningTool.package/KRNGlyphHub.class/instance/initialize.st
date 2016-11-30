as yet unclassified
initialize
	super initialize.

	fontList := Morph new
		layoutPolicy: TableLayout new;
		color: Color transparent;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		yourself.

	self createFontList.

	fontDetails := Morph new
		layoutPolicy: TableLayout new;  
		color: Color white;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		yourself.

	self
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		cellInset: 12;
		extent: 800 @ 500;
		color: Color white;
		addMorph: fontDetails;
		addMorph: fontList