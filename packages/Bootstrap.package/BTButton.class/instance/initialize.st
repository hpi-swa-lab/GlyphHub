as yet unclassified
initialize
	super initialize.
	
	label := BTLabel new text: 'Click me'.
	
	self
		add: label;
		padding: 16 @ 8;
		colorType: #primary