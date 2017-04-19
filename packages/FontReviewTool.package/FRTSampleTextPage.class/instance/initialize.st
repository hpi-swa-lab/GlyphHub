initialize-release
initialize

	super initialize.
	
	
	titleLabel := BTLabel new.
	authorLabel := BTLabel new align: #(end center).
	sampleTextLabel := BTLabel new.
	
	self
		add: (BTPage row
			add: titleLabel;
			add: authorLabel);
		add: sampleTextLabel