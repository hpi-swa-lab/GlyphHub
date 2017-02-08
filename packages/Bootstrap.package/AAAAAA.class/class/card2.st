as yet unclassified
card2
	| body header content |
	"content := BTImage new scalingMode: #rigid; extent: 200 asPoint; path: FileDirectory default / 'cat.jpg'."
	content := Morph new extent: 200 asPoint.
	body := BTCollapsible new add: content.
	header := BTCardHeader new
		add: (Morph new extent: 16 asPoint);
		do: [ body toggleCollapsed ];
		yourself.
	
	^BTCard new
			add: header;
			add: body;
			yourself