accessing
comment: aComment
	
	comment := aComment.
	
	metaInfo bold: '@', aComment author username, ' - ', (self printDate: aComment created).
	commentText text: aComment text.
	image path: FileDirectory default / 'BP2016H1' / 'assets' / 'penguin.png'.