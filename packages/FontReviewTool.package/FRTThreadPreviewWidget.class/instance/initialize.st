initialize-release
initialize

	super initialize.
	
	commentPreview := BTLabel new.
	threadTitle := (BTLabel new) bold.
	commentCount := BTButton new
		when: #clicked send: #openThread to: self.
	author := BTLabel new secondary.
	openClosedBadge := BTBadge new.
	
	self
		withLayout;
		vertical: true;
		padding: BTWidget spacing;
		add: (BTPage row
			add: threadTitle;
			add: author oppositeTo: openClosedBadge;
			add:  commentCount);
		add: commentPreview