initialize-release
initialize
	|  glyphArea glyphDetailArea commentThreadArea glyphDetailButtonRow |
	super initialize.
	
	glyphName := BTLabel new.
	
	glyphDetailButtonRow := BTPage row
		add: ((BTButton label: 'See previous versions') colorType: #secondary);
		add: ((BTButton label: 'New Comment Thread')
			expand: true;
			colorType: #primary;
			align: #(end start)).
	
	glyphDetailArea := BTPage column
		expand: true;
		add: glyphDetailButtonRow.
	
	glyphArea := BTPage row
		add: (BTImage new scalingMode: #fixed; minSize: 200 asPoint; path: FileDirectory default / 'BP2016H1' / 'assets' / 'cat.jpg');
		add: glyphDetailArea.
	
	commentThreadArea := BTPage column.
	
	"{FRTCommentThreadOld example1 . FRTCommentThreadOld example2} do: [:each |
		commentThreadArea add: (FRTCommentThreadPreviewWidget commentThread: each)]."
	
	self
		vertical: true;
		spacing: BTWidget spacing;
		add: glyphName;
		add: glyphArea;
		add: commentThreadArea