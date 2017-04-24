initialize-release
initialize

	|  glyphArea glyphDetailArea glyphDetailButtonRow |
	super initialize.
	
	glyphName := BTLabel new.
	unicodeLabel := BTLabel new.
	
	glyphDetailButtonRow := BTPage row
		add: ((BTButton label: (BTIcon icon: #history), ' See previous versions') colorType: #secondary);
		add: ((BTButton label: (BTIcon icon: #comment_o), ' New Thread')
			expand: true;
			colorType: #primary;
			align: #(end start);
			when: #clicked send: #createNewThread to: self).
	
	glyphDetailArea := BTPage column
		expand: true;
		add: glyphDetailButtonRow;
		add: unicodeLabel.
	
	glyphWidget := FRTGlyphWidget new
		centered: true;
		square: true.
	
	glyphArea := BTPage row
		add: glyphWidget;
		add: glyphDetailArea.
	
	commentThreadArea := BTPage column.
		
	self
		vertical: true;
		spacing: BTWidget spacing;
		add: glyphName;
		add: glyphArea;
		add: commentThreadArea