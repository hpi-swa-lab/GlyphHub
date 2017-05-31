initialize-release
initialize

	super initialize.
	
	checkbox := BTCheckbox new.
	label := BTLabel new.
	
	self
		when: #clickedWithEvent send: #toggleChecked to: self;
		add: checkbox;
		add: label;
		spacing: BTWidget spacing / 2