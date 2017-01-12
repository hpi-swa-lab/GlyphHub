as yet unclassified
initialize
	| container textContainer outer |
	outer := self createContainer.
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
		
	outer
		addMorphBack: container;
		addMorphBack: (Morph new
			vResizing: #rigid;
			height: 1;
			color: (Color gray: 0.7);
			hResizing: #spaceFill;
			yourself).
	
	text := TextMorph new
		wrapFlag: true;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		lock: true;
		yourself.
	
	textContainer
		addMorphBack: text;
		addMorphBack: meta.
	
	^outer