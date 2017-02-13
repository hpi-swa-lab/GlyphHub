as yet unclassified
comment: aComment
	
	| textContentMorph metaInfoMorph badgeMorph|
	comment := aComment.
	
	badgeMorph := BTBadge text: '42'. "TODO change to BTRow & read from collection from FRTComment"
	
	metaInfoMorph := BTPage row.
	metaInfoMorph add: badgeMorph oppositeTo: (BTLabel  secondary: '@', aComment author, ' - ', (self printDate: aComment dateTime)).
	
	textContentMorph := BTPage sizing: #(spaceFill shrinkWrap) vertical: true.
	textContentMorph
		add: (BTLabel  text: aComment text);
		add: metaInfoMorph.
	
	self
		add: (BTImage new scalingMode: #rigid; extent: 64 asPoint; path: FileDirectory default / 'BP2016H1' / 'assets' / 'penguin.png');
		add:  textContentMorph