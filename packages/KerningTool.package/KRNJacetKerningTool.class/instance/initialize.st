initialize-release
initialize
	| buttonPanel |
	super initialize.
	self color: Color lightGray.
	
	targetView := KRNTargetViewMorph new
		layoutInset: 10;
		color: Color white;
		borderWidth: 1;
		borderColor: Color black;
		layoutPolicy: (KRNParagraphLayout new lineHeight: 1.1; yourself);
		yourself.
	
	detailView := KRNGlyphInspectMorph new
		autoScale: true;
		yourself.
	
	buttonPanel := self createButtonPanel.
	
	cursor := KRNCursor new.
	
	self
		text: '';
		targetPtSize: 16;
		extent: 500 @ 500;
		addMorph: detailView fullFrame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 0.5) offsets: (0 @ 0 corner: 0 @ (self buttonPanelHeight / -2)));
		addMorph: targetView fullFrame: (LayoutFrame fractions: (0 @ 0.5 corner: 1 @ 1) offsets: (0 @ (self buttonPanelHeight / -2) corner: 0 @ (self buttonPanelHeight negated)));
		addMorph: buttonPanel fullFrame: (LayoutFrame fractions: (0 @ 1 corner: 1 @ 1) offsets: (0 @ (self buttonPanelHeight negated) corner: 0 @ 0));
		layoutPolicy: ProportionalLayout new;
		yourself