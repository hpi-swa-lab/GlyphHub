nested
testNestedTwoColumns
	| child row1 row2 rows topLevel |
	" single child left, two rows next to it
	# #########
	   
	   #########"
	child := BTWidget new minSize: 50 asPoint.
	row1 := BTWidget new minSize: 100 asPoint; align: #(expand start).
	row2 := BTWidget new minSize: 100 asPoint; align: #(expand start).
	rows := BTWidget new vertical: true; align: #(expand start); withLayout; add: row1; add: row2.
	topLevel := BTTopLevel new extent: 600 asPoint; vertical: false; spacing: 0; padding: 0; add: child; add: rows; fullBounds; yourself.
	
	self
		assert: 600 @ 200 equals: topLevel extent;
		assert: 550 @ 200 equals: rows extent