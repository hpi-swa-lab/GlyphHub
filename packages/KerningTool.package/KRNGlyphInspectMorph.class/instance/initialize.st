initialize-release
initialize
	super initialize.
	
	self
		color: Color white;
		layoutPolicy: (KRNParagraphLayout new lineHeight: 1.1; yourself);
		yourself