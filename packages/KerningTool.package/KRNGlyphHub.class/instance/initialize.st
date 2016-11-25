as yet unclassified
initialize
	super initialize.

	fontList := Morph new
		layoutPolicy: TableLayout new;
		color: Color transparent;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		yourself.

	{KRNUfo3 openBaskerville. KRNUfo3 openBaskerville} do: [ :font | 
		fontList addMorph: (SimpleButtonMorph new
			removeAllMorphs;
			layoutInset: 24;
			hResizing: #shrinkWrap;
			vResizing: #shrinkWrap;
			addMorph: font asMorph
			yourself) ].

	fontDetails := Morph new
		color: Color lightGray;
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