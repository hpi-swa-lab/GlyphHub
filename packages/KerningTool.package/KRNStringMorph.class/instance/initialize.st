as yet unclassified
initialize
	super initialize.
	
	self
		color: Color transparent;
		ptSize: 16;
		layoutPolicy: (KRNParagraphLayout new lineHeight: 1.2; center: true; yourself)