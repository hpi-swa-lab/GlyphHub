accessing
commentThread: aCommentThread
	| tagsMorph content |	
	commentThread := aCommentThread.
	
	self title: 'Thread: ', aCommentThread title.
	
	tagsMorph := BTPage row.
	aCommentThread tags do: [ :each | tagsMorph add: (BTBadge text: each) ].
	
	content := BTPage new
		withPadding;
		add: tagsMorph.
	
	aCommentThread comments do: [:each | content add: each asWidget].
	
	self content: content