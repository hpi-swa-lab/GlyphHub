as yet unclassified
versionPage
	| author a c shortO ta |
	author := BTPage row
		add: (BTImage new scalingMode: #fixed; minSize: 64 asPoint; path: FileDirectory default / 'BP2016H1' / 'assets' / 'penguin.png');
		add: (BTPage new
			align: #(fill start);
			add: (BTLabel bold: 'Tom Beckmann');
			add: (BTLabel text: '10. Feb 2017')).
	
	a := BTCard collapsible: 'A - Capital A' content: (BTLabel text: '<span size="60000">A</span>').
	c := BTCard collapsible: 'C - Captital C' content: (BTLabel text: '<span size="60000">C</span>').
	shortO := BTCard collapsible: 'ऒ - Short O' content: (BTLabel text: '<span size="60000">ऒ</span>').
	ta := BTCard collapsible: 'त - Ta' content: (BTLabel text: '<span size="60000">त</span>').
	{a. c. shortO. ta} do: [ :l | l maxSize: 300 @ -1 ].
	
	^BTTopLevel new
		size: 600 asPoint;
		add: author;
		add: (BTLabel pageHeader: 'Bitter Devanagari 0.1');
		add: (BTLabel text: 'In this update I incorporated the feedback from ', (BTLabel linkMarkup: '@font_master2323') ,' from here ', (BTLabel linkMarkup: '#125'));
		add: (BTLabel categoryHeader: 'Changes');
		add: (BTLabel subcategoryHeader: 'Latin');
		add: a;
		add: c;
		add: (BTLabel subcategoryHeader: 'Devanagari');
		add: shortO;
		add: ta
		yourself