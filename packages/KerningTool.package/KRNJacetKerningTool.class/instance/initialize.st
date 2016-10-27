as yet unclassified
initialize
	| buttonPanel |
	super initialize.
	
	targetView := Morph new
		layoutInset: 10;
		color: Color white;
		borderWidth: 1;
		borderColor: Color black;
		layoutPolicy: (KRNParagraphLayout new lineHeight: 1.1; yourself);
		yourself.
	
	detailView := Morph new
		layoutInset: 10;
		color: Color white;
		borderWidth: 1;
		borderColor: Color black;
		layoutPolicy: (KRNParagraphLayout new lineHeight: 1.1; yourself);
		yourself.
	
	buttonPanel := self createButtonPanel.
	
	cursor := KRNCursor new.
	
	self
		targetPtSize: 16;
		detailPtSize: 1.
	
	self
		extent: 500 @ 500;
		addMorph: detailView fullFrame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 0.5) offsets: (0 @ 0 corner: 0 @ (self buttonPanelHeight / -2)));
		addMorph: targetView fullFrame: (LayoutFrame fractions: (0 @ 0.5 corner: 1 @ 1) offsets: (0 @ (self buttonPanelHeight / -2) corner: 0 @ (self buttonPanelHeight negated)));
		addMorph: buttonPanel fullFrame: (LayoutFrame fractions: (0 @ 1 corner: 1 @ 1) offsets: (0 @ (self buttonPanelHeight negated) corner: 0 @ 0));
		layoutPolicy: ProportionalLayout new;
		yourself
	