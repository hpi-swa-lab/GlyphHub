as yet unclassified
cards
	| topLevel |
	topLevel := BTTopLevel new.
	
	3 timesRepeat: [ | body content header |
		content := BTImage new scalingMode: #fixed; minSize: 200 asPoint; path: FileDirectory default / 'BP2016H1' / 'assets' / 'cat.jpg'.
		body := BTCollapsible new add: (BTPage new add: content).
		header := BTCardHeader new
			add: (BTLabel text: 'This is a cat');
			do: [ body toggleCollapsed ];
			yourself.
	
		topLevel add: (BTCard new
			add: header;
			add: body;
			yourself) ].
		
	^topLevel