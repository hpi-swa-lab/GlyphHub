as yet unclassified
initialize
	| done title commentsList |
	super initialize.
	
	title := UiLabel new
		text: (((self title, ' ') asText allBold addAttribute: (TextFontReference toFont: (StrikeFont familyName: 'Bitmap DejaVu Sans' pointSize: 20)))
			append: (Text string: '(On version 0.0.1)' attribute: TextColor gray));
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		yourself.
	
	done := UiCheckBox new
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
			addMorphBack: (self createComment: 'Hi, this is a very long comment that spreads on multiple lines' author: 'tom' date: DateAndTime now);
			addMorphBack: (self createComment: 'blah' author: 'not_tom' date: DateAndTime noon);
			addMorphBack: (self createComment: 'blub' author: 'tom' date: DateAndTime new);
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
			addMorphBack: done;
			yourself);
		addMorphBack: commentsList