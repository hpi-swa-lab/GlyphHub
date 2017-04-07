initialize-release
initialize

	super initialize.
	
	commentPreview := BTLabel new.
	threadTitle := BTLabel new.
	commentCount := BTButton new.
	author := BTLabel new.
	
	self
		withLayout;
		vertical: true;
		padding: BTWidget spacing / 2;
		add: (BTPage row
			add: threadTitle;
			add: author oppositeTo: commentCount);
		add: commentPreview