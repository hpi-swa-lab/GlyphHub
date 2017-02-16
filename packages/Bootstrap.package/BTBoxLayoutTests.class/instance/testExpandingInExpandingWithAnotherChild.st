bugs
testExpandingInExpandingWithAnotherChild
	| inner outer |
	inner := BTWidget new withLayout; align: #(expand start).
	outer := BTWidget new
		withLayout;
		align: #(expand start);
		add: (BTWidget new color: Color red; minSize: 30);
		add: inner.

	BTTopLevel new size: 600 asPoint; padding: 0; add: outer; openInWorld.
	self flag: #todo