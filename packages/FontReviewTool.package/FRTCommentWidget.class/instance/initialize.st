initialize-release
initialize

	super initialize.
	
	userAvatar := BTImage new
		scalingMode: #fixed;
		minSize: 64.
	commentText := BTLabel new.
	metaInfo := BTLabel new bold.
	
	self
		withLayout;
		padding: BTWidget spacing / 2;
		spacing: BTWidget spacing;
		vResizing: #shrinkWrap;
		vertical: false;
		add: (BTPage row
			add: userAvatar;
			add: (BTPage column
				add: metaInfo;
				add: commentText))