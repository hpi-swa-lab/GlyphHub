initialize-release
initialize

	super initialize.
	
	commentPreview := BTLabel new.
	threadTitle := BTLabel new.
	commentCount := BTButton new
		when: #clicked send: #openThread to: self.
	author := BTLabel new.
	
	self
		withLayout;
		vertical: true;
		padding: BTWidget spacing;
		add: (BTPage row
			add: threadTitle;
			add: author oppositeTo: commentCount);
		add: commentPreview