as yet unclassified
initialize
	super initialize.
	
	title := UiLabel new
		text: (((self title, ' ') asText allBold addAttribute: (TextFontReference toFont: (StrikeFont familyName: 'Bitmap DejaVu Sans' pointSize: 20)))
			append: (Text string: '(On version 0.0.1)' attribute: TextColor gray));
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		yourself.
	
	isOpen := UiCheckBox new
		text: 'Done';
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		yourself.
	
	commentsList := UiScrollArea new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		horizontalScrollBarPolicy: #alwaysOff;
		verticalScrollBarPolicy: #asNeeded;
		widgetResizable: true;  
		widget: (self createContainer
			vResizing: #shrinkWrap;
			hResizing: #spaceFill;
			addMorphBack: (UiTextEdit new
				hResizing: #spaceFill;
				vResizing: #rigid;
				height: 48;
				yourself);
				yourself)
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