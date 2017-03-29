as yet unclassified
initialize
	super initialize.
	
	image := ImageMorph new
		extent: 80 @ 80;
		vResizing: #rigid;
		hResizing: #rigid;
		yourself.
	
	text := TextMorph new
		wrapFlag: true;
		lock: true;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		yourself.
	
	self
		changeTableLayout;
		listDirection: #leftToRight;
		width: self class width;
		layoutInset: 1;
		cellInset: 15;
		height: 66;
		addMorphBack: image;
		addMorphBack: text;
		yourself