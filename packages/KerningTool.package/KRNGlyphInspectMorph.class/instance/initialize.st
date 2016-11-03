initialize-release
initialize
	super initialize.
	
	self
		color: Color white;
		layoutPolicy: (KRNParagraphLayout new lineHeight: 1.2; center: true; yourself);
		yourself