initialize-release
initialize

	super initialize.
	
	check := BTCheckbox new.
	label := BTLabel new.
	
	self
		when: #clickedWithEvent send: #toggleChecked to: self;
		add: check;
		add: label;
		spacing: BTWidget spacing / 2