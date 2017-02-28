as yet unclassified
listGroup
	| group |
	group := BTListGroup new.
	
	#('First' 'Second' 'None') do: [ :text |
		group add: (BTListGroupItem new add: (BTLabel text: text) oppositeTo: (BTBadge text: '42')) ].
	
	^BTTopLevel new add: group