initialize-release
initialize
	super initialize.
	
	ptSize := 11.
	text := ''.
	autoScale := true.
	
	self
		color: Color white;
		layoutPolicy: (KRNParagraphLayout new lineHeight: 1.2; center: true; yourself);
		yourself