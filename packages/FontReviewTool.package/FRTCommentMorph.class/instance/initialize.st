as yet unclassified
initialize
	| container textContainer |
	super initialize.
	
	container := self createContainer listDirection: #leftToRight; yourself.
	textContainer := self createContainer.
	
	image := ImageMorph new
		extent: 80 @ 80;
		vResizing: #rigid;
		hResizing: #rigid;
		listSpacing: 60;
		yourself.
	
	meta := UiLabel new
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		color: Color gray;
		yourself.
	meta textMorph rightFlush.
	
	container
		addMorphBack: image;  
		addMorphBack: textContainer.
	
	text := UiLabel new
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		lock: true;
		yourself.
	
	textContainer
		addMorphBack: text;
		addMorphBack: meta.
	
	self
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		changeTableLayout;
		listDirection: #topToBottom;
		addMorphBack: container;
		addMorphBack: (Morph new
			vResizing: #rigid;
			height: 1;
			color: (Color gray: 0.7);
			hResizing: #spaceFill;
			yourself).