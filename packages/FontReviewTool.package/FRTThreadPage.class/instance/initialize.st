initialize-release
initialize

	super initialize.
	
	preview := FRTGlyphWidget new
		pointSize: 64;
		centered: true.
	
	subscriptionButton := BTButton new
		small;
		align: #(center center);
		when: #clicked send: #toggleSubscription to: self.
	
	closeButton := BTButton new
		when: #clicked send: #toggleClosed to: self.
	
	title := BTLabel new heading.
	tagArea := (BTPage row)
		spacing: BTWidget spacing / 3;
		yourself.
	commentArea := BTPage column.
	
	self
		withLayout;
		vertical: true;
		withPadding;
		add: (BTPage row
			add: title;
			add: BTWidget spacer;
			add: closeButton;
			add: subscriptionButton);		
		add: preview;
		add: tagArea;
		add: commentArea;
		add: ((BTButton text:  (BTIcon icon: #comment_o), ' Add new comment')
			colorType: #primary;
			align: #(end start);
			when: #clicked send: #addNewComment to: self)