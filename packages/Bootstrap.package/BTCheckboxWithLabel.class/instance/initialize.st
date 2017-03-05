as yet unclassified
initialize
	super initialize.
	
	check := BTCheckbox new.
	label := BTLabel new.
	
	self
		when: #clicked send: #toggleChecked to: self;
		add: check;
		add: label;
		spacing: BTWidget spacing / 2