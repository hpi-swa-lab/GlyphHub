as yet unclassified
commentThread: aCommentThread
	| headerArea |
	commentThread := aCommentThread.
	
	self removeAllMorphs.
	headerArea := BTPage row.
	headerArea
		add: ((BTLabel bold: aCommentThread title));
		add: ((BTLabel secondary: 'by ', aCommentThread author username)) oppositeTo: (BTButton label: aCommentThread comments size asString,' comments').
	
	self
		withLayout;
		vertical: true;
		padding: BTWidget spacing / 2;
		add: headerArea;
		add: (BTLabel text: commentThread comments first text)