as yet unclassified
card
	| body header content |
	content := BTImage new scalingMode: #rigid; extent: 200 asPoint; path: FileDirectory default / 'cat.jpg'.
	body := BTCollapsible new add: (BTPage new add: content).
	header := BTCardHeader new
		add: (BTLabel text: 'This is a cat');
		do: [ body toggleCollapsed ];
		yourself.
	
	^BTCard new
			add: header;
			add: body;
			yourself