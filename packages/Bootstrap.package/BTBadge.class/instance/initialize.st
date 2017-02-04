as yet unclassified
initialize
	super initialize.

	self
		changeTableLayout;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		colorType: #primary;
		layoutInset: 6 @ 4;
		add: (label := BTLabel new
			color: Color white;
			yourself)