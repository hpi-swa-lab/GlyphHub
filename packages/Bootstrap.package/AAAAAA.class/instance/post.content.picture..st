as yet unclassified
post: authorLine content: content picture: picture
	^BTRow new
		add: (BTImage new scalingMode: #rigid; extent: 64 asPoint; path: FileDirectory default / 'BP2016H1' / 'assets' / picture);
		add: (BTPage new
			padding: 0;
			add: (BTLabel bold: authorLine);
			add: (BTLabel text: content);
			add: (BTBadge text: 'Latin Script'))