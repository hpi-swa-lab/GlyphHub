initialize-release
initialize

	super initialize.
	
	preview := FRTGlyphWidget new
		centered: true.
	
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