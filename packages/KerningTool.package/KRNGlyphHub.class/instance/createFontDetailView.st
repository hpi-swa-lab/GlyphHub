as yet unclassified
createFontDetailView
	fontDetails removeAllMorphs.
	
	fontDetails addMorph: (self createFontListButton
		label: 'Adjust Kerning';
		target: self;
		actionSelector: #openKerningEditor;
		yourself).
	
	fontDetails addMorph: (self createFontListButton
		label: 'Add Glyphs from Scan';
		target: self;
		actionSelector: #openScanEditor;  
		yourself).
	
	fontDetails addMorph: (KRNStringMorph new
		hResizing: #spaceFill;
		ptSize: 20;
		font: selectedFont;
		center: false;  
		contents: 'This is my beautiful sample text sampling from a variety of letters, including a number of very exquisite ones that rarely occur in text, otherwise.').
	
	fontDetails addMorph: (KRNStringMorph new
		hResizing: #spaceFill;
		ptSize: 32;
		font: selectedFont;
		contents: selectedFont name;
		yourself).
		
	self layoutChanged