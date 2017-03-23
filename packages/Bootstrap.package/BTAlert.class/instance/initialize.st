initialize-release
initialize
	super initialize.
	
	self
		withLayout;
		align: #(fill start);
		vertical: true;
		padding: 20 @ 12;
		colorType: #warning