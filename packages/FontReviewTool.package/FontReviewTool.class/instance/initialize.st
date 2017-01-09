as yet unclassified
initialize 
	| page title alphabetPage inputPage textTemplatePage headline pageSwitcher |
	super initialize.
	
	alphabetPage := UiContainer new.
	inputPage := UiContainer new.
	textTemplatePage := self buildTextTemplatePage.
	
	headline := UiLabel new
		text: ('Vollkorn' asText allBold addAttribute: (TextFontReference toFont: (StrikeFont familyName: 'Bitmap DejaVu Sans' pointSize: 20)));
		hResizing: #spaceFill;
		yourself.
		
	pageSwitcher := UiButtonGroup new
		changeTableLayout;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		cellInset: -1;
		layoutInset: 0;
		listDirection: #leftToRight;
		borderStyle: (BorderStyle inset color: (Color gray: 0.85); width: 1);
		addMorphBack: (UiToolButton new color: (Color gray: 0.85); icon: UiSilkIcons textAlignCenterIcon; buttonStyle: #iconOnly; autoRaise: false; yourself);
		addMorphBack: (UiToolButton new color: (Color gray: 0.85); icon: UiSilkIcons textSmallcapsIcon; buttonStyle: #iconOnly; autoRaise: false; yourself);
		addMorphBack: (UiToolButton new color: (Color gray: 0.85); icon: UiSilkIcons textfieldIcon; buttonStyle: #iconOnly; autoRaise: false; yourself);
		yourself.
	
	title := UiContainer new
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		changeTableLayout;
		listDirection: #leftToRight;
		addAllMorphsBack: {headline. pageSwitcher};
		yourself.
	
	page := UiStackedWidget new
		addPageSilently: textTemplatePage;
		addPageSilently: alphabetPage;
		addPageSilently: inputPage;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		yourself.
	
	self connect: pageSwitcher signal: #currentIndexChanged: to: page selector: #currentIndex:.
	pageSwitcher firstSubmorph doClick.
	
	self
		changeTableLayout;
		listDirection: #topToBottom;
		addAllMorphsBack: {
			title.
			Morph new
				color: (Color gray: 0.1);
				height: 1;
				hResizing: #spaceFill;  
				yourself.  
			page
		};
		extent: 600 @ 350;
		color: Color white