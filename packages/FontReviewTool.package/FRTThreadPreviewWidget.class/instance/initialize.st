initialize-release
initialize

	super initialize.
	
	commentPreview := BTLabel new.
	threadTitle := (BTLabel new) bold.
	commentCount := BTButton new
		when: #clicked send: #openThread to: self.
	author := BTLabel new secondary.
	closedBadge := BTBadge new.
	
	self
		when: #clicked send: #openThread to: self;
		withLayout;
		vertical: true;
		padding: BTWidget spacing;
		add: (BTPage row
			add: threadTitle;
			add: author;
			add: BTWidget spacer;
			add: closedBadge;
			add: commentCount);
		add: commentPreview