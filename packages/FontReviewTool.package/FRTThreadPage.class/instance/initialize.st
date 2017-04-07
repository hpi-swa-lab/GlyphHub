initialize-release
initialize

	super initialize.
	
	preview := FRTThreadCodepointsPreviewLabel new
		align: #(center center);
		styleAttributes: {'size' -> '60000'}.
	
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
		add: preview;
		add: tagArea;
		add: commentArea;
		add: ((BTButton text:  (BTIcon icon: #comment_o), ' Add new comment')
			colorType: #primary;
			align: #(end start);
			when: #clickedNoEvent send: #addNewComment to: self)