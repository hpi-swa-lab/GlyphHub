as yet unclassified
initialize
	| commentsList |
	super initialize.
	
	title := UiLabel new
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		yourself.
	
	isOpen := UiCheckBox new
		text: 'Done';
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		yourself.
	
	commentTextInput := UiLineEdit new
		hResizing: #spaceFill;
		vResizing: #rigid;
		height: 48;
		yourself.
	
	self connect: commentTextInput signal: #returnPressed: toSelector: #onInputReturnPressed:.
	
	comments := self createContainer
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		addMorphBack: commentTextInput;
		yourself.
	
	commentsList := UiScrollArea new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		horizontalScrollBarPolicy: #alwaysOff;
		verticalScrollBarPolicy: #asNeeded;
		widgetResizable: true;  
		widget: comments;
		yourself.
	
	self
		changeTableLayout;
		color: Color white;
		height: 380;
		width: 700;
		cellInset: 6;
		layoutInset: 12;
		addMorphBack: (self createContainer
			listDirection: #leftToRight;
			addMorphBack: title;
			addMorphBack: isOpen;
			yourself);
		addMorphBack: commentsList