as yet unclassified
createComment: aString author: aName date: aDateAndTime
	| container meta image textContainer outer |
	outer := self createContainer.
	container := self createContainer listDirection: #leftToRight; yourself.
	textContainer := self createContainer.
	
	image := ImageMorph new
		image: (Form fromFileNamed: (FileDirectory default / 'BP2016H1' / 'notification_sample.png') fullName);
		extent: 80 @ 80;
		vResizing: #rigid;
		hResizing: #rigid;
		listSpacing: 60;
		yourself.
	
	meta := UiLabel new
		text: '@', aName, ' - ', (self printDate: aDateAndTime);
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
	
	textContainer
		addMorphBack: (TextMorph new
			contents: aString;
			wrapFlag: true;
			vResizing: #shrinkWrap;
			hResizing: #spaceFill;
			lock: true;
			yourself);
		addMorphBack: meta.
	
	^outer