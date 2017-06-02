mock-data
mockBigThread
	"contains three comments instead of one"

	| glyph newThread |
	newThread := self mockThread.
	glyph := newThread threadGlyphAssociations onlyElement glyph.
	newThread comments
		add: (FRTComment new
			text: 'second comment text';
			author: self mockUserOther;
			createdAt: DateAndTime now);
		add: (FRTComment new
			text: 'third comment text';
			author: self mockUserOther;
			" we use future to make sure that this comment is definitely unread by us "
			createdAt: DateAndTime tomorrow).
			
	^ newThread