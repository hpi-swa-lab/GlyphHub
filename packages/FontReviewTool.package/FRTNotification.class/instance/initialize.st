as yet unclassified
initialize
	| image text |
	super initialize.
	
	image := ImageMorph new
		image: (Form fromFileNamed: (FileDirectory default / 'BP2016H1' / 'notification_sample.png') fullName);
		extent: 80 @ 80;
		vResizing: #rigid;
		hResizing: #rigid;
		yourself.
	
	text := TextMorph new
		contents: 'Hi, this is a very long comment that spreads on multiple lines - @tom';
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