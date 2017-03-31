initialize-release
initialize
	super initialize.
	
	title := BTLabel new.
	tagArea := (BTPage row)
		spacing: BTWidget spacing / 3;
		yourself.
	commentArea := BTPage column.
	
	self
		withLayout;
		vertical: true;
		withPadding;
		add: title;
		add: tagArea;
		add: commentArea.