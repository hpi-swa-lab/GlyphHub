as yet unclassified
post: authorLine content: content picture: picture
	^BTRow new
		add: (BTImage new scalingMode: #rigid; extent: 64 asPoint; path: FileDirectory default / picture);
		add: (BTPage new
			layoutInset: 0;
			add: (BTLabel bold: authorLine);
			add: (BTLabel text: content);
			add: (BTBadge text: 'Latin Script'))