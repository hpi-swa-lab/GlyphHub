initialize-release
initialize
	| headingArea  glyphArea glyphDetailArea glyphDetailList commentThreadArea glyphDetailButtonRow |
	super initialize.
	
	headingArea := BTPage row
		spacing: 0;
		add: (BTLabel pageHeader: self marker fontProject name);
		add: (BTLabel heading: ' - Nice Name').
	
	glyphDetailList := BTDescriptionList new
		addItem: 'Unicode' description: self marker unicodePoints;
		addItem: 'OT Features' description: (self marker features ifEmpty: ['None'] ifNotEmpty: [self marker features inject: '' into: [:a :b | a,',',b]]);
		addItem: 'Unicode Block' description: 'Basic Latin';
		addItem: 'Current Version' description: '4.2'.
	
	glyphDetailButtonRow := BTPage row
		add: ((BTButton label: 'See previous versions') colorType: #secondary);
		add: ((BTButton label: 'New Comment Thread')
			expand: true;
			colorType: #primary;
			align: #(end start)).
	
	glyphDetailArea := BTPage column
		expand: true;
		add: glyphDetailList;
		add: glyphDetailButtonRow.
	
	glyphArea := BTPage row
		add: (BTImage new scalingMode: #fixed; minSize: 200 asPoint; path: FileDirectory default / 'BP2016H1' / 'assets' / 'cat.jpg');
		add: glyphDetailArea.
	
	commentThreadArea := BTPage column.
	
	{FRTCommentThreadOld example1 . FRTCommentThreadOld example2} do: [:each |
		commentThreadArea add: (FRTCommentThreadPreviewWidget commentThread: each)].
	
	self
		vertical: true;
		spacing: BTWidget spacing;
		add: headingArea;
		add: glyphArea;
		add: commentThreadArea