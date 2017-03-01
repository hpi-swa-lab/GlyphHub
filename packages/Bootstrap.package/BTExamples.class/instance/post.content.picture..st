as yet unclassified
post: authorLine content: content picture: picture
	^BTPage row
		add: (BTImage new scalingMode: #fixed; minSize: 64 asPoint; path: FileDirectory default / 'BP2016H1' / 'assets' / picture);
		add: ((BTPage new align: #(fill start); vertical: true)
			add: (BTLabel bold: authorLine);
			add: (BTLabel text: content);
			add: (BTBadge text: 'Latin Script'))