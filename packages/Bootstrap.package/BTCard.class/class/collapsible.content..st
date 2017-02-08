as yet unclassified
collapsible: aString content:  aWidget
	| content header |
	header := BTCardHeader new add: (BTLabel text: aString).
	content := BTCollapsible new collapsed: true; add: aWidget.
	
	header do: [ content toggleCollapsed ].
	
	^self new
		add: header;
		add: content