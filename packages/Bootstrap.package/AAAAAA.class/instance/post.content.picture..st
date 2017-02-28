as yet unclassified
post: authorLine content: content picture: picture
	^BTPage row
		add: (BTImage new scalingMode: #fixed; size: 64 asPoint; path: FileDirectory default / 'BP2016H1' / 'assets' / picture);
		add: ((BTPage new align: #(expand start); vertical: true)
			add: (BTLabel bold: authorLine);
			add: ((BTLabel text: content) fillMode: #fill);
			add: (BTBadge text: 'Latin Script'))