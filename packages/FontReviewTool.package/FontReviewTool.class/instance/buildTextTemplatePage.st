as yet unclassified
buildTextTemplatePage
	| page templateContainer |
	page := UiContainer new
		changeTableLayout;
		listDirection: #topToBottom;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		yourself.
	
	templateContainer := UiContainer new
		changeTableLayout;
		listDirection: #leftToRight;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		yourself.
	
	#('Latin 1' 'Deva' 'Cyrilic') do: [ :name |
		templateContainer addMorphBack: (UiPushButton new
			changeTableLayout;
			layoutInset: (0 @ 0 corner: -2 @ 0);
			listDirection: #topToBottom;
			removeAllMorphs;
			addMorphBack: (UiTextEdit new theText: 'Evil Wizards brew...'; lock; yourself);
			addMorphBack: (UiLabel new text: name);
			yourself) ].
	
	page
		addMorphBack: templateContainer;
		addMorphBack: (KRNStringMorph new
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			font: (KRNGlyphHub fonts at: 'Open Baskerville');
			ptSize: 48;
			color: Color white;
			contents: 'Das ist ein Test';
			center: false;
			yourself).
	
	^page