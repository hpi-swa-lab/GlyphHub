instance creation
collapsible: aString content:  aWidget
	| content header |
	header := BTCardHeader new add: (BTLabel text: aString).
	content := BTCollapsible new collapsed: true; add: aWidget.
	
	header when: #clicked send: #toggleCollapsed to: content.
	
	^self new
		add: header;
		add: content