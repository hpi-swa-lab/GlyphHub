initialize-release
initialize
	super initialize.
	
	image := BTImage new
		scalingMode: #fixed;
		minSize: 64.
	commentText := BTLabel new.
	metaInfo := BTLabel new.
	
	self
		vResizing: #shrinkWrap;
		vertical: false;
		add: (BTPage row
			add: image;
			add: (BTPage column
				add: metaInfo;
				add: commentText)).