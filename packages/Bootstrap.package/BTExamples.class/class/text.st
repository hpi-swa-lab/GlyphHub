as yet unclassified
text
	| topLevel |
	topLevel := BTTopLevel new.
	
	^topLevel
		add: (BTLabel pageHeader: 'Page Header!');
		add: (BTLabel heading: 'Heading!');
		add: (BTLabel subHeading: 'Sub Heading');
		
		add: (BTLabel categoryHeader: 'Category Header!');
		add: (BTLabel subcategoryHeader: 'Subcategory Header!');
		
		add: (BTLabel bold: 'Bold!');
		add: (BTLabel text: 'Just text');
		add: (BTLabel small: 'Small...');
		add: (BTLabel secondary: 'Secondary');
		
		add: ((BTLink text: 'Click me pls')
			when: #clicked
			evaluate: [ :event | topLevel displayNotification: 'hi' type: #success ])