as yet unclassified
versionPage
	| author a c shortO ta |
	author := BTRow new
		add: (BTImage new scalingMode: #rigid; extent: 64 asPoint; path: FileDirectory default / 'penguin.png');
		add: (BTPage new
			padding: 0;
			add: (BTLabel bold: 'Tom Beckmann');
			add: (BTLabel text: '10. Feb 2017')).
	
	a := BTCard collapsible: 'A - Capital A' content: (BTLabel text: '<span size="60000">A</span>').
	c := BTCard collapsible: 'C - Captital C' content: (BTLabel text: '<span size="60000">C</span>').
	shortO := BTCard collapsible: 'ऒ - Short O' content: (BTLabel text: '<span size="60000">ऒ</span>').
	ta := BTCard collapsible: 'त - Ta' content: (BTLabel text: '<span size="60000">त</span>').
	{a. c. shortO. ta} do: [ :l | l width: 300 ].
	
	^BTPage topLevel
		add: author;
		add: (BTLabel pageHeader: 'Bitter Devanagari 0.1');
		add: (BTLabel text: 'In this update I incorporated the feedback from ', (BTLabel linkMarkup: '@font_master2323') ,' from here ', (BTLabel linkMarkup: '#125'));
		add: (BTLabel categoryHeader: 'Changes');
		add: (BTLabel subcategoryHeader: 'Latin');
		add: a;
		add: c;
		add: (BTLabel subcategoryHeader: 'Devagari');
		add: shortO;
		add: ta