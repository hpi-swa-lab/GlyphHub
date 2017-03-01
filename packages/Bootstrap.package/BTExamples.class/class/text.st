as yet unclassified
text
	^BTTopLevel new
		add: (BTLabel pageHeader: 'Page Header!');
		add: (BTLabel heading: 'Heading!');
		add: (BTLabel subHeading: 'Sub Heading');
		
		add: (BTLabel categoryHeader: 'Category Header!');
		add: (BTLabel subcategoryHeader: 'Subcategory Header!');
		
		add: (BTLabel bold: 'Bold!');
		add: (BTLabel text: 'Just text');
		add: (BTLabel small: 'Small...');
		add: (BTLabel secondary: 'Secondary');
		
		add: ((BTLink text: 'Click me pls') do: [ :link | link topLevel displayNotification: 'hi.' type: #success ])