initialize-release
initialize
	super initialize.
	
	title := BTLabel new.
	tagArea := BTPage row.
	commentArea := BTPage column.
	
	self
		withLayout;
		vertical: true;
		withPadding;
		add: title;
		add: tagArea;
		add: commentArea.