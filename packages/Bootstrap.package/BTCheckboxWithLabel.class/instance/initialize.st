as yet unclassified
initialize
	super initialize.
	
	check := BTCheckbox new.
	label := BTLabel new.
	
	self
		do: [ self toggleChecked ];
		add: check;
		add: label;
		spacing: BTWidget spacing / 2