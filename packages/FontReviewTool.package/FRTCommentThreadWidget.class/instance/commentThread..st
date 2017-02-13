as yet unclassified
commentThread: aCommentThread

	| headerMorph tagsMorph |	
	commentThread := aCommentThread.
	
	headerMorph := BTPage row.
	headerMorph
		alignItems: #center;
		add: (BTLabel heading: aCommentThread title);
		add: ((BTLabel subcategoryHeader: '(On version 0.0.1)') ). 
	
	tagsMorph := BTPage row.
	aCommentThread tags do: [:each | tagsMorph add: (BTBadge text: each)].
	
	self 
		add: headerMorph;
		add: tagsMorph.
	
	aCommentThread comments do: [:each | self add: each asWidget]